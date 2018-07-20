class SelectedController < ApplicationController



  def random_item
    @items = Item.all
    @selected_item = Item.all.shuffle.first
  end

  def random_restaurant
    @restaurants = Restaurant.all
    @selected_restaurant = Restaurant.all.shuffle.first
  end

end
