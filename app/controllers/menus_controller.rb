class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    @restaurant = Restaurant.find(params[:restaurant_id])

    @menus = Menu.where(restaurant_id: @restaurant ).paginate(page: params[:page]).order("created_at DESC")

  end

  def show
    @user = current_user
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = Menu.find(params[:id])


    @restaurants = Restaurant.where(user_id: @user).paginate(page: params[:page]).order("created_at DESC")
  end

  def new
    @user = current_user

    @restaurant = Restaurant.find(params[:restaurant_id])
    # @restaurant = Restaurant.find(params[:id])
    @menu = @restaurant.menus.build
  end

  def edit
    @user = current_user
    # @menu = Menu.find(params[:id])

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
            format.html { redirect_to restaurant_menu_path(@restaurant.id , @menu), notice: 'Menu was successfully created.' }
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


    ### No route matches [DELETE] "/restaurants/1/menus"
  ### /restaurants/:restaurant_id/menus/:id(.:format)
  def destroy
    @user = current_user
    @restaurant = Restaurant.find(params[:restaurant_id])

    @menu.destroy
    respond_to do |format|
      format.html { redirect_to user_restaurants_path(@user, @restaurant), notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_menu
      @menu = Menu.find(params[:id])
    end

    def menu_params
      params.require(:menu).permit(:title, :restaurant_id)
    end

end
