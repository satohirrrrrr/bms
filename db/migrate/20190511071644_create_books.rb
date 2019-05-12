class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name, null: false
      t.string :isbn_10, limit: 13
      t.string :isbn_13, limit: 17
      t.string :asin, limit: 10
      t.string :publicated_on, limit: 8
      t.string :publisher
      t.integer :page_size, limit: 2
      t.string :storage_location
      t.string :control_number
      t.string :amazon_url
      t.string :image_url
      t.string :image_data

      t.timestamps
    end

    add_index :books, :name, unique: false
    add_index :books, :isbn_10, unique: true
    add_index :books, :isbn_13, unique: true
    add_index :books, :asin, unique: true
  end
end
