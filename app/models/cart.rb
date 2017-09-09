class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items

  def add_product(cart_item_params)
    current_item = cart_items.find_by(product_id: cart_item_params[:product_id])

    if current_item
      current_item.save
    else
      new_item = cart_items.create(product_id: cart_item_params[:product_id], cart_id: cart_item_params[:cart_id])
    end
    new_item
  end
end
