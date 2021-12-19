class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :photo, null: false
      t.text :bio, null: false
      t.timestamps
      t.integer :posts_counter, default: 0, null: false
    end
  end
end
