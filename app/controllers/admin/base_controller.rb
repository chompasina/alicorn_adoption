class Admin::BaseController < ApplicationController
  before_action :require_admin
  # helper_method :all_orders 
  
  def require_admin
    response.status = 404 unless current_admin?
    render file: "/public/404" unless current_admin?
  end
  
  # def all_orders
  #   Order.all
  # end  
end