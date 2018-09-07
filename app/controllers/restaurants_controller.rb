class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user

    @restaurants = Restaurant.where(user_id: current_user ).paginate(page: params[:page]).order("created_at DESC")
    #### Pagination found in model.rb file(control amount of @instances per page)
  end

  def show
    @user = current_user
    @restaurant = Restaurant.find(params[:id])
    @menus = Menu.where(restaurant_id: @restaurant )

  end

  def new
    @user = current_user
    # @user = User.find(params[:id])
    @restaurant = @user.restaurants.build
  end

  def edit
    @user = current_user
  end

  def create
    # @restaurant = @restaurant.build(restaurant_params)
    # @restaurant = current_user.restaurants.build
    @user = current_user
    @restaurant = Restaurant.new(restaurant_params)


    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to restaurants_path(@restaurant), notice: 'Restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:title, :user_id)
    end
end
