class OrdersController < ApplicationController
  before_action :set_item, only:[:index, :create]
  before_action :return_item, only: :index
  before_action :move_to_index, only: :index

  def index
    # session[:item_id] = params[:item_id]
    @order = OrderPurchase.new
    if current_user.id == @item.user_id #出品者本人が購入ページへ行こうとするとトップページへ遷移する
      redirect_to root_path
    end
  end

  def create
    @order = OrderPurchase.new(order_params)
    if @order.valid? #もしDBに保存できたなら
      pay_item #pay_itemメソッドを起動させる
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
    #  {token,}   order_purchase{ {token,postal} }
  def order_params
    params.permit(:token, :postal_code, :shipping_region_id, :city, :address, :building_name, :phone_number, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] #Pay.jpの秘密鍵
    Payjp::Charge.create(
      amount: @item.selling_price,          #商品の値段
      card: params[:token],                 #カードのトークン
      currency:'jpy'                        #通貨の種類(日本円)
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def return_item
    if @item.purchase != nil #購入されている場合はトップページへ遷移する
      redirect_to root_path
    end
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in? #ログインしていないユーザーは新規登録画面へ遷移する
  end
end
