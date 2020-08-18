class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # アクティブハッシュのアソシエーション
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :days_until_shipping

  # アソシエーション
  belongs_to :user
  has_one_attached :image

  # バリデーション

  # with_optionsでまとめてバリデーションを付けている
  with_options presence: true do
    validates :name, :description, :selling_price
  end

  # アクティブハッシュのバリデーション
  with_options numericality: { other_than: 1 } do
    validates :category_id, :status_id, :shipping_charge_id, :shipping_region_id, :days_until_shipping_id
  end
end
