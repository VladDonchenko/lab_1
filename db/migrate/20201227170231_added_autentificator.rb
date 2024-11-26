class AddedAutentificator < ActiveRecord::Migration[6.1]
  def change
    add_column :autors, :email, :string
    add_column :autors, :password, :string
    add_column :autors, :password_digest, :string
  end
end
