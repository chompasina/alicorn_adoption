require "rails_helper"
require "support/test_helper"

RSpec.feature "Admin views all orders" do
  before do
    create_orders
  end
  scenario "logged in admin can view listing of all orders" do
    admin_login
    
    visit admin_dashboard_index_path
    
    expect(page).to have_content("Completed 1")
    expect(page).to have_content("Ordered 1")
    expect(page).to have_content("Paid 2")
    expect(page).to have_content("Canceled 1")
    expect(page).to have_link("Order: 1")
    expect(page).to have_link("Order: 2")
    expect(page).to have_link("Order: 3")
    expect(page).to have_link("Order: 4")
    expect(page).to have_link("Order: 5")
  end
end