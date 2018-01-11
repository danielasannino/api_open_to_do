class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.string :name
      t.references :user, index: true
      t.string :permissions, default: 'private'

      t.timestamps null: false
    end
    add_foreign_key :lists, :users
  end
end
