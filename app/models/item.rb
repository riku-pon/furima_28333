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
  has_one :item_order
  has_one_attached :image

  # バリデーション
  SELLING_PRICE = /\A[0-9]+\z/.freeze

  # アクティブハッシュのバリデーション
  # other_than: 1でidが1以外であれば保存できる
  with_options numericality: { other_than: 1, message: 'Select' } do # with_optionsでまとめてバリデーションを付けている
    validates :category_id, :status_id, :shipping_charge_id, :shipping_region_id, :days_until_shipping_id
  end

  # presence: trueで空の投稿ができなくなる
  with_options presence: true do # with_optionsでまとめてバリデーションを付けている
    validates :image, :name, :description, :selling_price
  end

  # 価格は半角数字でないと保存できない
  validates :selling_price, numericality: { with: SELLING_PRICE, message: 'Half-width number' }
  # 価格が数値のみでないと保存できない
  validates :selling_price, numericality: { only_integer: true, message: 'Other than numbers' }
  # 価格が300円〜9999999円の範囲であること
  validates :selling_price, inclusion: { in: (300..9_999_999), message: 'Out of setting range' }
end
