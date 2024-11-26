class AddAvatarToAutors < ActiveRecord::Migration[6.1]
  def change
    add_column :autors, :avatar, :string
  end
end
