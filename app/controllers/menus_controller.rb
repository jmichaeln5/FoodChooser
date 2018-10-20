class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])

    @menus = Menu.where(restaurant_id: @restaurant ).paginate(page: params[:page]).order("created_at DESC")

  end

  def show
    @restaurant = @menu.restaurant.id
    
    @menus = Menu.where(restaurant_id: @restaurant ).paginate(page: params[:page]).order("created_at DESC")

    @items = Item.where(menu_id: @menu ).paginate(page: params[:page]).order("created_at DESC")
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = @restaurant.menus.build
  end

  def edit
  end

  # POST /menus
  # POST /menus.json
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = @restaurant.menus.build(menu_params)

        respond_to do |format|
          if @menu.save
            format.html { redirect_to @menu, notice: 'Menu was successfully created.' }
            format.json { render :show, status: :created, location: @menu }
          else
            format.html { render :new }
            format.json { render json: @menu.errors, status: :unprocessable_entity }
          end
        end
      end

  def update
    # @restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant = @menu.restaurant.id

    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to @menu, notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu}
      else
        format.html { render :edit }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @restaurant = @menu.restaurant
    @user = current_user

    @menu.destroy
    respond_to do |format|
      format.html { redirect_to restaurant_menus_path(@restaurant), notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_menu
      @menu = Menu.find(params[:id])
    end

    def set_user
      @user = current_user
    end

    def menu_params
      params.require(:menu).permit(:title, :restaurant_id)
    end

end
