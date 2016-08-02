class Admin::CreaturesController < Admin::BaseController
  before_action :set_creature, only: [:edit, :update]
  
  def index
    @creatures = Creature.all
  end
  
  def edit
  end
  
  def update
    @creature.update_attributes(creature_params)
    if @creature.save
      redirect_to admin_creatures_path
    else
      render :edit
      flash[:notice] = "Invalid"
    end
  end
  
  def set_creature
    @creature = Creature.find(params[:id])
  end
  
  private
  
  def creature_params
    params.require(:creature).permit(:name, :price, :description, :retired, :image_path)
  end
end