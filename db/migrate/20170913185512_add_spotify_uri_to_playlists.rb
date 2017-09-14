class AddSpotifyUriToPlaylists < ActiveRecord::Migration[5.1]
  def change
    add_column :playlists, :spotify_uri, :string
  end
end
