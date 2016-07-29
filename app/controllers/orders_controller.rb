class OrdersController < ApplicationController
  
  def index
    @orders = current_user.orders
  end
  
  def create
    # byebug
    @order = Order.create(params(session[:cart]))
    redirect_to orders_path
  end
end