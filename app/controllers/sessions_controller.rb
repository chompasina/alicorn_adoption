class SessionsController < ApplicationController
  
  def new
  end
  
  def destroy 
    session.clear
    flash[:notice] = "Successfully logged out"
    redirect_to root_path
  end
end