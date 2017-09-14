class CartController < ApplicationController
  def new
  end

  def create
    @cart = Cart.new(user_id: @current_user.id)
    if @cart.save
      redirect_to products_path
    end
  end

  def destroy
  end
end
