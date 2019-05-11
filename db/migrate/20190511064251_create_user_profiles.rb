class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.integer :user_id, null: false
      t.string :last_name, null: false, limit: 20
      t.string :first_name, null: false, limit: 20
      t.string :last_name_kana, limit: 50
      t.string :first_name_kana, limit: 50
      t.integer :owned_books_count, null: false, limit: 3, default: 0
      t.integer :lending_books_count, null: false, limit: 3, default: 0
      t.integer :borrowing_books_count, null: false, limit: 3, default: 0
      t.boolean :deleted, null:false, default: false

      t.timestamps
    end

    add_index :user_profiles, :user_id, unique: true
  end
end
