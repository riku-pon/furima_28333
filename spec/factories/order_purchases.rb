FactoryBot.define do
  factory :order_purchase do
    postal_code { '123-4567' }
    shipping_region_id { 2 }
    city { '富山県' }
    address { '1-1' }
    building_name { '富山ハイツ' }
    phone_number { 11_122_223_333 }
  end
end
