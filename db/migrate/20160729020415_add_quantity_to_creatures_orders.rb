class AddQuantityToCreaturesOrders < ActiveRecord::Migration
  def change
    add_column :creatures_orders, :quantity, :integer
  end
end
