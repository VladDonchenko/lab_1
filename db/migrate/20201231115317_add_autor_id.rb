class AddAutorId < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :autor_id, :integer
  end
end
