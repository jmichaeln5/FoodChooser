class UsersController < ApplicationController

  def dashboard
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
      if user.save
        session[:user_id] = user.id
        redirect_to '/dashboard'
      else
        flash[:register_errors] = ["REGISTER ERROR. Invalid credentials, please try again."]
        redirect_to users_index_path
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
     redirect_to root_path, :notice => ['You have successfully deleted your profile.']
  end


  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end
