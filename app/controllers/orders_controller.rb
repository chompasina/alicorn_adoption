class OrdersController < ApplicationController
  helper_method :orders
  
  def index
    orders
  end
  
  def create
    if current_user && session[:cart]
      @order = current_user.orders.create
      params[:contents].each do |key, value|
        @order.creatures_orders.create(creature_id: key, quantity: value)
      end
      @order.assign_total_price
      flash[:notice] = "Order was successfully placed"
      render :index
    elsif current_user 
      flash[:notice] = "Your cart is empty."
      redirect_to cart_path
    else  
      redirect_to login_path
    end
  end
  
  def orders
    @orders = current_user.orders
  end
  
  def show
    @order = Order.find(params[:id])
  end
end