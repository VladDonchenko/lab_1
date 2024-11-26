class AddTwoImageToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :main_image, :string
    add_column :posts, :second_image, :string
  end
end
