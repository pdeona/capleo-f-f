json.extract! product, :id, :name, :spotify_id, :artist, :image, :created_at, :updated_at
json.url product_url(product, format: :json)
