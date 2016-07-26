FactoryGirl.define do

  creature_names = ["Unicorn", "Centaur"]
  creature_prices = [200.00, 300.00]
  type_names = ["Land", "Sea"]

  factory :creature do
    name creature_names.sample
    price creature_prices.sample
  end

  factory :type do
    name type_names.sample
  end

end
