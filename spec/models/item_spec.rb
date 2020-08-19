require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end
    describe '出品した商品の保存' do
      context '商品の出品がうまくいくとき' do
        it '全ての値が正しく入力されていれば保存できること' do
          expect(@item).to be_valid
        end
      end

      context '商品の出品がうまくいかないとき' do
        it 'imageが空では保存できないこと' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it 'nameが空では保存できないこと' do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end

        it 'descriptionが空では保存できないこと' do
          @item.description = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end

        it 'selling_priceが空では保存できないこと' do
          @item.selling_price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Selling price can't be blank")
        end

        it 'selling_priceが299円以下では保存できないこと' do
          @item.selling_price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Selling price Out of setting range')
        end

        it 'selling_priceが10000000円以上では保存できないこと' do
          @item.selling_price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('Selling price Out of setting range')
        end

        it 'selling_priceが半角数字以外では登録できないこと' do
          @item.selling_price = 'あ'
          @item.valid?
          expect(@item.errors.full_messages).to include('Selling price Half-width number')
        end

        it 'category_idが「1」では保存できないこと' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category Select')
        end

        it 'status_idが「1」では保存できないこと' do
          @item.status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Status Select')
        end

        it 'shipping_charge_idが「1」では保存できないこと' do
          @item.shipping_charge_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping charge Select')
        end

        it 'shipping_region_idが「1」では保存できないこと' do
          @item.shipping_region_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping region Select')
        end

        it 'days_until_shipping_idが「1」では保存できないこと' do
          @item.days_until_shipping_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Days until shipping Select')
        end
      end
    end
  end
end
