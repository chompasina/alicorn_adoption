class TypesController < ApplicationController
  
  def show
    # require 'pry'; binding.pry
    @type = Type.find_by(name: params[:name].downcase.capitalize)
    @creatures = @type.creatures
  end
end