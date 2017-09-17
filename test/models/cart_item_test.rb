require 'test_helper'

class CartItemTest < ActiveSupport::TestCase
	# A CART_ITEM HAS A CART ID AND PRODUCT ID

	# create_table "cart_items", force: :cascade do |t|
  #   t.integer "cart_id"
  #   t.integer "product_id"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.index ["cart_id"], name: "index_cart_items_on_cart_id"
  #   t.index ["product_id"], name: "index_cart_items_on_product_id"
  # end
	def setup

		@cart_item = CartItem.new(cart_id: "integer", product_id: "integer",
										 name: 'index_cart_items_on_product_id')
	end

	test "a cart item id is an integer" do
		@cart_id.is_a(Integer)
		@cart_id.is_a(@index_cart_items_on_product_id)
	end

	test "a cart item has a cart_id" do
		@cart_item.assert_includes(@cart_id)
	end

	test "a cart item has a name" do
		@cart_item.assert_includes(@name)
	end

	test "a cart item has a product_id" do
		@cart_item.assert_includes(@product_id)
	end

	test "a cart item can be added to cart" do
		@cart << @cart_item
	end

	test "a cart item can be removed from cart" do
		@cart.remove(@cart_item)
	end

	test "a cart item can be a playlist" do
		@cart_item == @playlist
	end

end
