class OrderPurchase

  include ActiveModel::Model
  attr_accessor :token, :postal_code, :shipping_region_id, :city, :address, :building_name, :phone_number, :user_id, :item_id

  POSTAL_CODE = /\A[0-9]{3}-[0-9]{4}\z/.freeze

  #orderモデルのバリデーション
  with_options presence: true do
    validates :postal_code, format: { with: POSTAL_CODE, message: "is invalid. Include hyphen(-)"}
    validates :city, :address, :phone_number
  end
  validates :shipping_region_id, numericality:{ other_than: 1, message: 'Select' }

  def save
    #住所の情報を保存
    Order.create( postal_code: postal_code, shipping_region_id: shipping_region_id, city: city, address: address, building_name: building_name, phone_number: phone_number, user_id: user_id, item_id: item_id)
    #購入履歴の情報を保存
    Purchase.create( user_id: user_id, item_id: item_id)
  end
end