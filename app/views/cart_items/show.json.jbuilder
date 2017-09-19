json.cart_items do |cart_item|
  json.cart_id cart_item.cart_id
  json.product_id cart_item.product_id
end
