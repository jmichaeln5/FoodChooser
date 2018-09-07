class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email:login_params[:email])
    if user && user.authenticate(login_params[:password])
      session[:user_id] = user.id
      redirect_to current_user
    else
      flash[:login_errors] = ['Invalid credentials, please try again.']
      # redirect_to users_index_path
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    cookies.delete(:auth_token)
    redirect_to root_url, :notice => "Logged out successfully."
  end

  private

  def login_params
    params.require(:login).permit(:email, :password)
  end

end
