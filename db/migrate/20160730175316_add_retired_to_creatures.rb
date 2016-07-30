class AddRetiredToCreatures < ActiveRecord::Migration
  def change
    add_column :creatures, :retired, :boolean, default: false
  end
end
