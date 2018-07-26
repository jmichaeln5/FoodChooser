class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    @restaurant = Restaurant.find(params[:restaurant_id])
    @restaurants = Restaurant.where(user_id: @user)
    @menus = Menu.where(restaurant_id: @restaurant).order("created_at DESC")
  end

  def show
    @user = current_user
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = Menu.find(params[:id])

    # @restaurants = Restaurant.where(user_id: @user).paginate(page: params[:page]).order("created_at DESC")
  end

  def new
    @user = current_user
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = @restaurant.menus.build
  end

  def edit
    @user = current_user
    @menu = Menu.find(params[:id])
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  # POST /menus
  # POST /menus.json
  def create
    @user = current_user
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = @restaurant.menus.build(menu_params)

    respond_to do |format|
      if @menu.save

        format.html { redirect_to restaurant_menus_path(@restaurant), notice: 'Menu was successfully created.' }
        # format.html { redirect_to new_item_path, notice: 'Menu was successfully created.' }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to @menu, notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to menus_url, notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_menu
      @menu = Menu.find(params[:id])
    end

    def menu_params
      params.require(:menu).permit(:title, :user_id, :restaurant_id)
    end
end
