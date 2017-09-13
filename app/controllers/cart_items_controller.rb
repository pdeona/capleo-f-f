class CartItemsController < ApplicationController

  before_action :set_cart_item, only: [:create, :destroy]

  def create
    @cart = Cart.find_by(user_id: @current_user.id)
    rescue ActiveRecord::RecordNotFound
      @cart = Cart.create(user_id: params[:session][:user_id])
    @cart.cart_items << @cart_item
    if @cart_item.save
      redirect_to products_path
    end
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
