class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :creatures, :orders do |t|
      t.index [:creature_id, :order_id]
      t.index [:order_id, :creature_id]
    end
  end
end
