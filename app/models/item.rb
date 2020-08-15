class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name, :description, :selling_price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id, :status_id, :shipping_charge_id, :shipping_region_id, :days_until_shipping_id
  end
end
