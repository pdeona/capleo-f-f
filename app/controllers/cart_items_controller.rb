class CartItemsController < ApplicationController

  before_action :set_cart_item, only: [:destroy]

  def create
    if @current_user
      @cart_item = CartItem.new(product_id: params[:product], cart_id: @cart.id)
      if @cart_item.save
        @cart.cart_items << @cart_item
        redirect_to products_path(anchor: 'product-well'), notice: 'Item added successfully'
      end
    else
      redirect_to login_path, danger: 'You must be logged in to do that'
    end
  end

  def destroy
    @cart_item.destroy
    redirect_to user_path(@current_user, anchor: 'current-user-cart')
  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @cart_item = CartItem.create(cart_id: @cart.id, product_id: params[:cart_item][:product_id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :cart_id)
  end
end
