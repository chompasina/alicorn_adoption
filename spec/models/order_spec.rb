require 'rails_helper'

RSpec.describe Order, type: :model do
  it "has a valid factory" do
    FactoryGirl.create(:order).should be_valid
  end

  it "has order details" do 
    Order.new()
    
    <% order.order_details.each do |key, value| %>
      <tr>
        <th><%= link_to key, creature_path(find_creature(key)) %></th>
        <th><%= value.last %></th>
        <th><%= number_to_currency(value.first) %></th>
      </tr>
  
end