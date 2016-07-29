class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path(@user)
      flash[:notice] = "You have successfully created an account!"
    else
      flash[:notice] = "Invalid Information"
      redirect_to new_user_path
    end
  end
  
  def show
    @user = User.find(session[:user_id])
  end
  
private
  
  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end