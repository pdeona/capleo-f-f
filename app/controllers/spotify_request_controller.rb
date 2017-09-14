class SpotifyRequestController < ApplicationController
  include SpotifyRequestHelper

  def search
    query = params[:search]
    @response = RSpotify::Track.search(query)
    parse_response
    redirect_to products_path
  end

  def checkout
    @tracks = []
    @cart.cart_items.each do |item|
      product = Product.find(item.product_id)
      @tracks << product.spotify_id
    end
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    p = spotify_user.create_playlist!('test1', public: true)
    spotify_songs = []
    @tracks.each do |track|
      spotify_songs << RSpotify::Track.find(track)
    end
    # p spotify_songs
    p.add_tracks!(spotify_songs)
    p p.external_urls
    redirect_to user_path(@cart.user_id)
  end
end
