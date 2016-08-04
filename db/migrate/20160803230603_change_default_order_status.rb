class ChangeDefaultOrderStatus < ActiveRecord::Migration
  def change
    change_column_default(:orders, :status, 'awaiting payment')
  end
end
