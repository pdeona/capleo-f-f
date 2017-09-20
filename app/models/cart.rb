class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items

  def item_grab
    products = []
    self.cart_items.each do |item|
      product = Product.find item.product_id
      products << product
    end
    products
  end

end
