class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :first_name
      t.string :last_name
      t.string :address_string
      t.string :desc

      t.timestamps
    end
  end
end
