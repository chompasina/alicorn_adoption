require 'rails_helper'

RSpec.describe Cart, type: :model do
  session_input = {
    "1" => 3,
    "2" => 1, 
    "3" => 5
  }
  cart = Cart.new(session_input)

  
  it "has a contents hash upon creation" do
    empty_cart = Cart.new({})
    empty_cart.contents.should_not == nil
  end
  
  it "should be able to add a creature" do
    cart.add_creature(3)
    cart.count_of(3).should == 6
  end
  
  it "should accurately count a creature" do
    cart.count_of(2).should == 1
  end
  
  it "should accurately report the total number of creatures" do
    cart.total.should == 10
  end
  
  it "should return creatures in the cart" do
    FactoryGirl.create(:creature)
    one_creature_cart = Cart.new("1" => 1)
    one_creature_cart.creatures.count.should == 1
  end
end