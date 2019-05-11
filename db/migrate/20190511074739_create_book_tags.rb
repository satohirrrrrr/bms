class CreateBookTags < ActiveRecord::Migration[5.2]
  def change
    create_table :book_tags do |t|
      t.integer :book_id, null: false
      t.integer :tag_id, null: false
      
      t.timestamps
    end

    add_index :book_tags, [:book_id, :tag_id], unique: true
  end
end
