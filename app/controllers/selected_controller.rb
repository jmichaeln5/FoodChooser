class SelectedController < ApplicationController

  # def random_item
  #   @user = current_user
  #
  #   @items = Item.where(menu_id: current_user ).paginate(page: params[:page]).order("created_at DESC")
  #   @selected_item = @items.all.shuffle.first
  # end

  def random_restaurant
    @user = current_user

    @restaurants = Restaurant.where(user_id: current_user ).paginate(page: params[:page]).order("created_at DESC")
    @selected_restaurant = @restaurants.shuffle.first
  end

end
