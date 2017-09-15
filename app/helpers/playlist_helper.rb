module PlaylistHelper
  # send playlist creation request
  def make_playlist user, list_name
    user.create_playlist!(list_name, public: true)
  end

  def add_songs tracklist, playlist_object
    playlist_object.add_tracks!(tracklist)
    playlist = Playlist.new(user_id: @current_user.id, spotify_uri: playlist_object.external_urls["spotify"])
    playlist.save
    redirect_to user_path(@cart.user_id)
  end
end
