class AddImagePathToCreatures < ActiveRecord::Migration
  def change
    add_column :creatures, :image_path, :string
  end
end
