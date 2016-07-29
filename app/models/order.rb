class Order < ActiveRecord::Base
  has_many :creatures_orders
  has_many :creatures, through: :creatures_orders
  belongs_to :user
  
  def self.total_price(cart)
    total_price = 0
    unless cart.nil?
      cart.each do |id, qty| 
        total_price += qty * Creature.find(id).price
      end 
    total_price
    end
  end
end
