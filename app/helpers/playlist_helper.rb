module PlaylistHelper
  # send playlist creation request
  def make_playlist user, list_name
    user.create_playlist!(list_name, public: true)
  end

  # send add_tracks request with array of RSpotify Track objects as argument,
  # then build a Playlist object in db so we can return useful info to the user
  def add_songs tracklist, playlist_object
    playlist_object.add_tracks!(tracklist)
    playlist = Playlist.new(user_id: @current_user.id, name: playlist_object.name, spotify_uri: playlist_object.external_urls["spotify"])
    playlist.save
    redirect_to user_path(@cart.user_id)
  end
end
