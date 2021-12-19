class ChangePhotoColumn < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :photo, true, default: nil
  end
end
