class CartController < ApplicationController

  def create
    cart = Cart.create(:user_id => @current_user.id)
    cart.save
  end
end
