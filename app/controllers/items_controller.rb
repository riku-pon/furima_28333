class ItemsController < ApplicationController
  before_action :move_to_new, only: :new

  def index
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

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :shipping_charge_id, :shipping_region_id, :days_until_shipping_id, :selling_price).merge(user_id: current_user.id)
  end

  def move_to_new
    redirect_to new_user_session_path unless user_signed_in?
  end
end
