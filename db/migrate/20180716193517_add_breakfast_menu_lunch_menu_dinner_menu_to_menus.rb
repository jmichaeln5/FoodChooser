class AddBreakfastMenuLunchMenuDinnerMenuToMenus < ActiveRecord::Migration[5.1]
  def change
    add_column :menus, :breakfast_menu, :string
    add_column :menus, :lunch_menu, :string
    add_column :menus, :dinner_menu, :string
  end
end
