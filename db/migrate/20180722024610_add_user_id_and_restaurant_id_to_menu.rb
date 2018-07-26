class AddUserIdAndRestaurantIdToMenu < ActiveRecord::Migration[5.1]
  def change
    add_column :menus, :user_id, :bigint
    add_column :menus, :restaurant_id, :bigint

    add_index :menus, :user_id
    add_index :menus, :restaurant_id
  end
end
