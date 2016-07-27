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
end