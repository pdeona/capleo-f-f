class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:create, :destroy]

  def create
    @cart.cart_items << @cart_item
    @cart.save
  end

  def destroy
    @cart_item.destroy
    redirect_to user_path(@user)
  end

  private

  def set_cart_item
    @cart_item = CartItem.find_by(cart_item_params)
    if !(@cart_item)
      @cart_item = CartItem.create(cart_item_params)
    end
  end

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :cart_id)
  end
end
