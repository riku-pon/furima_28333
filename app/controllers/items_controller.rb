class ItemsController < ApplicationController
  before_action :move_to_new, only: :new
  before_action :find_item, only: :order
  before_action :item_purcahced? 
  
  # def item_purcahced? メンターさんに質問して教えていただいたところ（商品購入機能）
  #   @item = Item.find(params[:item_id])
  #   if @item.order.persisted
  #     redirect_to root_path
  #   end 
  # end

  def index
    @items = Item.all.order('created_at DESC') # 商品の並びを新着順にしている
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def order # 購入する時のアクションを定義
    ItemOrder.create(item_id: params[:id]) # 商品のid情報を「item_id」として保存する
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :shipping_charge_id, :shipping_region_id, :days_until_shipping_id, :selling_price).merge(user_id: current_user.id)
  end

  def move_to_new
    redirect_to new_user_session_path unless user_signed_in?
  end

  def find_item
    @item = Item.find(params[:id]) # 購入する商品を特定
  end
end
