class SelectedController < ApplicationController
  
  def random_item
    @selected_item = Item.all.shuffle.first
  end

end
