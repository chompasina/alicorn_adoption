class SessionsController < ApplicationController
  
  def new
  end
  
  def destroy 
    session.clear
    flash[:notice] = "Successfully logged out"
    redirect_to root_path
  end
  
  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to '/admin/dashboard' if current_admin?
      redirect_to '/dashboard' unless current_admin?
    else
      flash[:notice] = "Invalid Login"
      render :new      
    end
  end
end