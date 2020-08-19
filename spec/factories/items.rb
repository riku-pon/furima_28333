FactoryBot.define do
  factory :item do
    name { 'もの' }
    description { 'ものです' }
    category_id { '2' }
    status_id { '2' }
    shipping_charge_id { '2' }
    shipping_region_id { '2' }
    days_until_shipping_id { '2' }
    selling_price { '9999999' }
    association :user
  end
end
