class Comment < ApplicationRecord
  belongs_to :post, required: true, counter_cache: true
  belongs_to :autor, required: true
  has_many :autor_comment_votes
  has_ancestry

  enum status: %i[unpublished published]

  validates :body, presence: true
  validates :body, length: { minimum: 5 }
  def count_likes
    autor_comment_votes.liked.count
  end

  def count_dislikes
    autor_comment_votes.disliked.count
  end
end
