class TypesController < ApplicationController
  
  def show
    @type = Type.find_by(name: params[:name])
    @creatures = @type.creatures
  end
end