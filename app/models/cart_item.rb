class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  validates :product_id, :cart_id, presence: true
end
