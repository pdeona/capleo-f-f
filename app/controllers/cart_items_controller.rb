class CartItemsController < ApplicationController

  def create
    cart_item = CartItem.find_by(product_id: @product.id)
    if (@cart.save && cart_item.cart_id)
      cart_item.save
    else
      flash.now[:error] = "There was an issue adding this item to your cart."
      redirect_to product_path(@product)
    end
  end

  def update
    self.create
    @cart.add_product(self)
    if @cart.save
      redirect_to products_path
    else
      flash.now[:error] = "There was an issue with your cart."
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
