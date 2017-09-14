class SpotifyRequestController < ApplicationController
  include SpotifyRequestHelper

  after_action :clean_up, only: :checkout

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
      item.destroy
    end
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    p = spotify_user.create_playlist!('test1', public: true)
    spotify_songs = []
    @tracks.each do |track|
      spotify_songs << RSpotify::Track.find(track)
    end
    # p spotify_songs
    p.add_tracks!(spotify_songs)
    @playlist = Playlist.new(user_id: @current_user.id, spotify_uri: p.external_urls[:spotify])
    @playlist.save
    redirect_to user_path(@cart.user_id)
  end
end
