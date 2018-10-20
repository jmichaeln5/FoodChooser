class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  def index
    @users = User.all
    # @restaurants = Restaurant.where(user_id: @user).paginate(page: params[:page]).order("created_at DESC")
    #### Pagination found in model.rb file(control amount of @instances per page)
  end

  def show
    @user = current_user
    @user_restaurants = @user.restaurants.order("created_at DESC")
  end

  def new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create

    # user = User.new(user_params)
    @user = User.new(user_params)

      if @user.save
        session[:user_id] = @user.id
        redirect_to current_user

        flash[:register_success] = ["Welcome #{current_user.email}, thank you for registering."]
      else
        flash[:register_errors] = ["REGISTER ERROR. Invalid credentials, please try again."]
        # redirect_to users_index_path
        redirect_to root_path
      end
  end

  def update

      @user = User.find(params[:id])

      if @user.update(user_params)
        redirect_to @user, :notice => "Profile updated successfully."
      else
         redirect_to @user, :notice => ['Profile could not be updated, please try again later.']
      end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => 'You have deleted your profile.'
   else
     redirect_to users_edit_path, :notice => ["User can not be deleted at this time."]
   end
  end

  private

    def set_user
      @user = current_user
    end

    def user_params
      params.require(:user).permit( :email, :password, :password_confirmation)
    end

end
