json.extract! cart_item, :id, :cart_id, :product_id
json.url cart_items_url(cart_item, format: :json)
