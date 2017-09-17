require 'test_helper'

class ProductTest < ActiveSupport::TestCase
	# validates :artist, :spotify_id, :name, presence: true
  # has_many :reviews

	def setup
		@product = Product.new(name: "string", cart_items_id: "integer",
										 cart_items_id: 'integer', spotify_id: 'string')
	end
	# A PRODUCT HAS A BUNCH OF ATTRIBUTES THAT CAN BE FOUND IN THE SCHEME.  WRITE TESTS TO REJECT INVALID ENTRIES AND ACCEPT VALID ONES.

	# create_table "products", force: :cascade do |t|
  #   t.string "name"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.integer "cart_items_id"
  #   t.string "artist"
  #   t.string "spotify_id"
  #   t.index ["cart_items_id"], name: "index_products_on_cart_items_id"
  # end

	test "product name is a string" do
		@product.name = ""
	end

	test "product name is a string" do
		@product.image = ""
	end

	test "product's artist name is a string" do
		@product.artist = ""
	end

	test "product has a spotify user id" do
		@product.assert_includes(@spotify_id)
	end

	test "spotify user id is a string" do
		@product.spotify_id = ""
	end

	test "product has a cart_items_id" do
		@product.assert_includes(@cart_items_id)
	end

	test "cart_items_id is an integer" do
		@cart_items_id.assert.is_a(Integer)
	end

	test "product goes into cart" do
		@cart << @product
	end
end
