class CartItemsController < ApplicationController

  before_action :set_cart_item, only: [:create, :destroy]

  def create
    p @cart_item
    if @cart_item.save
      @cart.cart_items << @cart_item
      redirect_to products_path
    end
  end

  def destroy
    @cart_item.destroy
    redirect_to user_path(@user)
  end

  private

  def set_cart_item
    @cart_item = CartItem.find_by(cart_id: @cart.id)
    unless @cart_item
      @cart_item = CartItem.create(cart_id: @cart.id, product_id: params[:cart_item][:product_id])
    end
  end

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :cart_id)
  end
end
