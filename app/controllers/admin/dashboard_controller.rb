class Admin::DashboardController < Admin::BaseController
  def index
  end
  
  def edit
    @user = current_user
  end
  
  def update
    current_user.update_attributes(user_params)
    if current_user.save
      redirect_to admin_dashboard_index_path
    else
      render :edit
      flash[:notice] = "Invalid"
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:password, :username, :email)
  end
end