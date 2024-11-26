class CreateAutorCommentVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :autor_comment_votes do |t|
      t.belongs_to :comment
      t.belongs_to :autor
      t.boolean :positive
      t.timestamps
    end
  end
end
