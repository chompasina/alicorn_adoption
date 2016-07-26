require 'rails_helper'

RSpec.describe Creature, type: :model do
  it "has a valid factory" do
    FactoryGirl.create(:creature).should be_valid
  end

  it "is invalid without a name" do
    FactoryGirl.build(:creature, name: nil).should_not be_valid
  end

end
