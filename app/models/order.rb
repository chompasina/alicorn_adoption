class Order < ActiveRecord::Base
  def self.total(cart)
  end
  
  def self.total_price(cart)
    total_price = 0.00
    cart.each do |id, quantity|
      total_price += quantity*Creature.find(id).price
    end
    total_price
  end
end
