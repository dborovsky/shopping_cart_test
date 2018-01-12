FactoryBot.define do
  factory :order_item do
    item nil
    order nil
    quantity 1
    total_price 1
  end
end
