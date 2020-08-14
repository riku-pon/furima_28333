class ItemsController < ApplicationController
  before_action :move_to_new, only: :new

  def index
  end

  def new
  end

  private

  def move_to_new
    unless user_signed_in?
      redirect_to "/users/sign_in"
    end
  end
end
