class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.bigint :author_id
      t.string :title
      t.text :text
      t.integer :comments_counter
      t.integer :likes_counter

      t.timestamps
    end

    add_column :posts, :author_id, :bigint
    add_foreign_key :posts, :users, column: :author_id
    add_index :posts, :author_id
  end
end
