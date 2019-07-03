class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name, null: false
      t.string :subtitle
      t.text :description
      t.string :isbn_10, limit: 13
      t.string :isbn_13, limit: 17
      t.string :publicated_on, limit: 10
      t.string :publisher
      t.integer :page_size, limit: 2
      t.string :storage_location
      t.string :control_number
      t.string :image_url
      t.boolean :is_sync_gba, null: false, default: false

      t.timestamps
    end

    add_index :books, :name, unique: false
    add_index :books, :isbn_10, unique: true
    add_index :books, :isbn_13, unique: true
  end
end
