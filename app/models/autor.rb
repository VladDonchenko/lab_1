class Autor < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :email
  has_many :posts
  has_many :comments
  has_many :autor_comment_votes

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  # Немогу понять в чём проблема, если подключить валидацию не сохраняется страничка пользователя.
  # PASSWORD_FORMAT = /\A
  #    (?=.{8,})           # Must contain 8 or more characters
  #    (?=.*[A-Z])         # Must contain an upper case character
  #    (?=.*[[:^alnum:]])  # Must contain a symbol
  #  /x

  #   validates :password_digest, presence: true, format: { with: PASSWORD_FORMAT }, unless: :persisted?

  validates :password, presence: true, length: { minimum: 8, maximum: 50 }, unless: :persisted?
  validates :email, presence: true, length: { minimum: 5, maximum: 50 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  def full_name
    "#{first_name} #{last_name} "
  end
end
