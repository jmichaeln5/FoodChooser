class StartController < ApplicationController

  def index
    @restaurant = Restaurant.new
    @menu= Menu.new
    @item = Item.new
  end

end
