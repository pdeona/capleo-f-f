json.products do |product|
  json.name product.name
  json.artist product.artist
  json.image product.image
  json.spotify_id product.spotify_id
end
