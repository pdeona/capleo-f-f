json.extract! products, :id, :name, :spotify_id, :artist, :image, :created_at, :updated_at
json.url products_url(products, format: :json)
