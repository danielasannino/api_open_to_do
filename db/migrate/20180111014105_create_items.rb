class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.references :list, index: true
      t.string :description
      t.boolean :completed, default: false

      t.timestamps null: false
    end
    add_foreign_key :items, :lists
  end
end
