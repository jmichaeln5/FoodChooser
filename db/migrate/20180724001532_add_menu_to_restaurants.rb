class AddMenuToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_reference :restaurants, :menu, foreign_key: true
  end
end
