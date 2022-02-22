class AddUserIdToCronies < ActiveRecord::Migration[7.0]
  def change
    add_column :cronies, :user_id, :integer
    add_index :cronies, :user_id
  end
end
