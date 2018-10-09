class SelectedController < ApplicationController

  def random_item
    @user = current_user

    @items = Item.all
    @selected_item = Item.all.shuffle.first
  end

  def random_restaurant
    @user = current_user

    @restaurants = Restaurant.all
    @selected_restaurant = Restaurant.all.shuffle.first

    # @restaurants = Restaurant.where(user_id: @user)
    # @selected_restaurant = @restaurants.all.shuffle.first

  end

end
