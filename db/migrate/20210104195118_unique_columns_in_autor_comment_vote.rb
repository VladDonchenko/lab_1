class UniqueColumnsInAutorCommentVote < ActiveRecord::Migration[6.1]
  def change
    add_index :autor_comment_votes, %i[autor_id comment_id], unique: true
  end
end
