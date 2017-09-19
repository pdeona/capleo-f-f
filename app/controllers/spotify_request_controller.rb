class SpotifyRequestController < ApplicationController
  include SpotifyRequestHelper
  include PlaylistHelper

  # after_action :clean_up_db, only: :checkout

  def search
    if !(@current_user.nil?)
      query = params[:search]
      @response = RSpotify::Track.search(query)
      parse_response
      session[:search] = query
      redirect_to products_path
    else
      redirect_to login_path
    end
  end

  def playlist_create
    session[:list_name] = params[:list_name]
    redirect_to spotify_login_path
  end

  def checkout
    tracks = cart_cleanup @cart
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    playlist = make_playlist spotify_user, session[:list_name]
    session[:list_name] = nil
    tracklist = build_tracklist tracks
    unless tracklist.empty?
      add_songs tracklist, playlist
    end
    respond_to do |format|
      format.html {
        redirect_to user_path(@current_user),
        notice: 'Playlist ' + Playlist.last.name + ' successfully created.'
      }
    end
  end
end
