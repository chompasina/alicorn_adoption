class Order < ActiveRecord::Base
  has_many :creatures_orders
  has_many :creatures, through: :creatures_orders
  belongs_to :user
  
  def order_details
    order_items = CreaturesOrder.where(order_id: self.id)
    order_details = {}
    order_items.each do |item|
      name = Creature.find(item.creature_id).name
      price = Creature.find(item.creature_id).price
      qty = item.quantity
      order_details[name] = [price, qty]
    end
    order_details
  end
  
  def total_price
    total_price = 0
    self.order_details.each do |key, value|
      total_price += value.reduce(:*)
    end
    total_price
  end
end
