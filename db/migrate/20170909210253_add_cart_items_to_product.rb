class AddCartItemsToProduct < ActiveRecord::Migration[5.1]
  def change
    add_reference :products, :cart_items, foreign_key: true
  end
end
