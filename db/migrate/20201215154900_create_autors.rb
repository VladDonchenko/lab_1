class CreateAutors < ActiveRecord::Migration[6.1]
  def change
    create_table :autors do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.datetime :birthday

      t.timestamps
    end
  end
end
