class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper
  
  def create
    creature = Creature.find(params[:creature_id])
    @cart.add_creature(creature.id)
    session[:cart] = @cart.contents
    flash[:notice] = "You now have selected #{pluralize(@cart.count_of(creature.id), creature.name)}."
    redirect_to root_path
  end
  
  def index
    @creatures = @cart.creatures
  end
  
  def update
    if params[:add]
      session[:cart][params[:add]] += 1
    else
      qty = session[:cart][params[:remove]]
      qty -= 1 unless qty == 0
      session[:cart][params[:remove]] = qty
    end
    redirect_to cart_path
  end
  
  def destroy
    @creature = Creature.find(params[:creature_id])
    session[:cart] = @cart.contents
    session[:cart][@creature.id] = 0
    session[:removed_creature] = @creature.id
    delete_link = "<a href=\"#{url_for(@creature)}\">#{@creature.name}</a>"
    flash[:delete] = "Successfully removed #{delete_link} from your cart"
    redirect_to cart_path
  end
end