class AutorCommentVote < ApplicationRecord
  belongs_to :comment
  belongs_to :autor

  scope :liked, -> { where(positive: true) }
  scope :disliked, -> { where(positive: false) }
end
