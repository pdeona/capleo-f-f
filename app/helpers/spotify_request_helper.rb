module SpotifyRequestHelper

  # build a list of products from our Spotify API response
  def parse_response
    if @response
      @response.each do |track|
        Product.create(name: track.name, artist: track.artists[0].name, spotify_id: track.id, image: track.album.images[0]['url'])
      end
    end
  end

  # grab our song list and give our user a fresh cart to refill
  def cart_cleanup cart
    tracks = []
    cart.cart_items.each do |item|
      product = Product.find(item.product_id)
      tracks << product.spotify_id
      item.destroy
    end
    tracks
  end

  # build an array of RSpotify Track objects to make our playlist with
  def build_tracklist track_array
    spotify_songs = []
    track_array.each do |track|
      spotify_songs << RSpotify::Track.find(track)
    end
    spotify_songs
  end

  # delete unused products from db to avoid clutter
  def clean_up_db
    products = Product.all
    products.each do |product|
      if product.cart_items_id == nil
        # product.destroy
      end
    end
  end

end
