class CartController < ApplicationController

  def create
    cart = Cart.create(:user_id => @user.id)
    cart.save
  end
end
