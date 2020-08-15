class ItemsController < ApplicationController
  before_action :move_to_new, only: :new

  def index
  end

  def new
  end

  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category,:status, :shipping_charges, :shipping_region, :days_until_shipping, :selling_price).merge(user_id: current_user.id)
  end

  def move_to_new
    unless user_signed_in?
      redirect_to "/users/sign_in"
    end
  end
end
