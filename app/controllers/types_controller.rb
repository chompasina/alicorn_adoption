class TypesController < ApplicationController
  
  def show
    @type = Type.find_by(name: params[:name].capitalize)
    @creatures = @type.creatures
  end
end