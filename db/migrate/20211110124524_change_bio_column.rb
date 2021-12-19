class ChangeBioColumn < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :bio, true
  end
end
