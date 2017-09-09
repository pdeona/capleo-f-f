class CartItemsController < ApplicationController
  before_action :current_cart, only [:create, :destroy]

  def create
    @cart.add_product(cart_item_params)

    if @cart.save
      redirect_to products_path
    else
      flash.now[:error] = "There was an issue adding this item to your cart."
      redirect_to @product
    end
  end

  def destroy
    @cart_item.destroy
    redirect_to cart_path
  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :cart_id)
  end
end
