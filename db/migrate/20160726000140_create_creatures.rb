class CreateCreatures < ActiveRecord::Migration
  def change
    create_table :creatures do |t|
      t.string :name
      t.decimal :price
      t.references :type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end