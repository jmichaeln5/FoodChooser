class SelectedController < ApplicationController

  def random_item

    @user = current_user
    @restaurants = @user.restaurants
    @menus = Restaurant.where(user_id: @user.id)
    # Begin ### Block defines @user_items
    item_arr = []
    @restaurants.each do |restaurant|
      restaurant.menus.each do |menu|
        menu.items.each do |item|
          item_arr << item
           item_arr.flatten!
        end
      end
    end
    @user_items = []
    randomized_arr = []
    item_arr.shuffle.each do |item|
      @user_items << item
      randomized_arr << item[:item_name]
      randomized_arr.flatten!
    end
    # End ### Block defines  @user_items

    @items = @user_items
    @menu = @user_items[0].menu
    @item = @user_items[0]


  end


  def random_restaurant
    @user = current_user
    @restaurants = Restaurant.where(user_id: current_user ).paginate(page: params[:page]).order("created_at DESC")
    @selected_restaurant = @restaurants.shuffle.first
  end

end
