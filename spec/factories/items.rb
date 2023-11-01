FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    unit_price { Faker::Number.between(from: 1000, to: 10000) }
    association :merchant
  end
end