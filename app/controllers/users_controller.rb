class UsersController < ApplicationController

  def dashboard
    @user = current_user

    @restaurants = Restaurant.where(user_id: @user).order("created_at DESC")

    #
    # @restaurants = current_user.restaurants
    #
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    user = User.new(user_params)
      if user.save
        session[:user_id] = user.id
        redirect_to '/dashboard'
      else
        flash[:register_errors] = ["REGISTER ERROR. Invalid credentials, please try again."]
        # redirect_to users_index_path
        redirect_to root_path
      end
  end

  def update
      if @user.update(user_params)
         redirect_to @user, :notice => ['Profile was successfully updated.']
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

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end
