class AddMenuIdToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :menus, :user, foreign_key: true
  end
end
