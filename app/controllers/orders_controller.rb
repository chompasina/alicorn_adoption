class OrdersController < ApplicationController
  helper_method :orders
  
  def index
    orders
  end
  
  def create
    @order = current_user.orders.create
    params[:contents].each do |key, value|
      @order.creatures_orders.create(creature_id: key, quantity: value)
    end
    @order.assign_total_price
    flash[:notice] = "Order was successfully placed"
    render :index
  end
  
  def orders
    @orders = current_user.orders
  end
  
  def show
    @order = Order.find(params[:id])
  end
end