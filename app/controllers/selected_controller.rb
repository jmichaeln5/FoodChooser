class SelectedController < ApplicationController

  def random_item
    @selected_item = Item.all.shuffle.first
  end

  def random_restaurant
    @selected_restaurant = Restaurant.all.shuffle.first
  end

end
