require 'rails_helper'

RSpec.describe OrderPurchase, type: :model do
  describe '#create' do
    before do
      @order_purchase = FactoryBot.build(:order_purchase)
    end

    describe '住所の登録' do
      context '商品の購入がうまくいくとき' do
        it '全ての値が正しく入力されていれば購入できること' do
          expect(@order_purchase).to be_valid
        end

        it 'building_nameが空でも購入できること' do
          @order_purchase.building_name = nil
          expect(@order_purchase).to be_valid
        end
      end

      context '商品の購入がうまくいかないとき' do
        it 'postal_codeが空だと購入できない' do
          @order_purchase.postal_code = nil
          @order_purchase.valid?
          expect(@order_purchase.errors.full_messages).to include("Postal code can't be blank")
        end
        it 'postal_codeが半角のハイフンを含んだ形式出ないと購入できない' do
          @order_purchase.postal_code = '1234567'
          @order_purchase.valid?
          expect(@order_purchase.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
        end
        it 'shipping_region_idが「１」では購入できないこと' do
          @order_purchase.shipping_region_id = 1
          @order_purchase.valid?
          expect(@order_purchase.errors.full_messages).to include('Shipping region Select')
        end
        it 'cityが空だと購入できないこと' do
          @order_purchase.city = nil
          @order_purchase.valid?
          expect(@order_purchase.errors.full_messages).to include("City can't be blank")
        end
        it 'addressが空だと購入できないこと' do
          @order_purchase.address = nil
          @order_purchase.valid?
          expect(@order_purchase.errors.full_messages).to include("Address can't be blank")
        end
        it 'phone_numberが空だと購入できないこと' do
          @order_purchase.phone_number = nil
          @order_purchase.valid?
          expect(@order_purchase.errors.full_messages).to include("Phone number can't be blank")
        end
        it 'tokenが空だと購入できないこと' do
          @order_purchase.token = nil
          @order_purchase.valid?
          expect(@order_purchase.errors.full_messages).to include("Token can't be blank")
        end
      end
    end
  end
end
