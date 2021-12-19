class ChangePostCounterColumn < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :posts_counter, default: 0, null: true
  end
end
