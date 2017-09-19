json.cart_items do |cart_item|
  HTTParty.post(cart_items_path,
    body: {
    'cart_id' => cart_item.cart_id
    'product_id' => cart_item.product_id
    }.to_json,
    headers: {
      'Content-type' => 'application/json'
    }
  )
end
