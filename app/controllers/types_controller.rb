class TypesController < ApplicationController
  
  def show
    @type = Type.find(params[:id])
    @creatures = @type.creatures
  end
end