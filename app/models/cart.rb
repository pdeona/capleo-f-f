class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items

  def add_product(cart_item_params)
    current_item = CartItem.create(cart_item_params)
    if current_item
      @cart.cart_items << current_item
    else
      redirect_to products_path
    end
  end
end
