class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name, null: false
      t.string :isbn_code, limit: 13
      t.string :asin_code, limit: 10
      t.string :author, limit: 20
      t.string :publication_year_month, limit: 6
      t.string :publisher
      t.integer :page_size, limit: 2
      t.string :storage_location
      t.string :amazon_url
      t.string :image_url
      t.string :image_data

      t.timestamps
    end

    add_index :books, :name, unique: false
    add_index :books, :isbn_code, unique: true
    add_index :books, :asin_code, unique: true
  end
end
