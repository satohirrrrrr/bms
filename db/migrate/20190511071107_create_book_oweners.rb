class CreateBookOweners < ActiveRecord::Migration[5.2]
  def change
    create_table :book_oweners do |t|
      t.integer :user_id
      t.integer :book_id, null: false
      t.integer :number_of_posession, null: false, limit: 3, default: 1

      t.timestamps
    end

    add_index :book_oweners, [:user_id, :book_id], unique: true
  end
end
