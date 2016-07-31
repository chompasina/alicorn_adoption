require 'rails_helper'

RSpec.describe Order, type: :model do
  it "has a valid factory" do
    FactoryGirl.create(:order).should be_valid
  end

  it "has an order status of completed" do 
    alicorn = Order.new(status: "completed")
    alicorn.completed?.should == true
  end
  
  it "has an order status of canceled" do 
    unicorn = Order.new(status: "canceled")
    unicorn.canceled?.should == true
  end
end