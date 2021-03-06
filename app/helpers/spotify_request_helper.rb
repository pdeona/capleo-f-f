module SpotifyRequestHelper

  # build a list of products from our Spotify API response
  def parse_response response
    if response
      response.each do |track|
        Product.create_with(name: track.name, artist: track.artists[0].name, image: track.album.images[0]['url']).find_or_create_by(spotify_id: track.id)
      end
    end
  end

  # grab our song list and give our user a fresh cart to refill
  def cart_cleanup cart
    tracks = cart.item_grab
    cart.cart_items.each do |item|
      item.destroy
    end
    tracks
  end

  # build an array of RSpotify Track objects to make our playlist with
  def build_tracklist track_array
    spotify_songs = []
    track_array.each do |track|
      spotify_songs << RSpotify::Track.find(track.spotify_id)
    end
    spotify_songs
  end

  # delete unused products from db to avoid clutter
  def clean_up_db
    items = CartItem.all
    cartproducts = items.map { |item| item.product_id }
    products = Product.all
    products.each do |product|
      unless cartproducts.include?(product.id)
        product.destroy
      end
    end
  end

end
