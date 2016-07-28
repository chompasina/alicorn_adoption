class Order < ActiveRecord::Base
  
  def self.total_price(cart)
    total_price = 0
    cart.each do |id, qty| 
      total_price += qty*Creature.find(id).price
    end unless cart.nil?
    total_price
  end
end
