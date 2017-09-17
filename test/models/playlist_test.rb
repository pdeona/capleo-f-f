require 'test_helper'

class PlaylistTest < ActiveSupport::TestCase
	# create_table "playlists", force: :cascade do |t|
	#   t.integer "user_id"
	#   t.datetime "created_at", null: false
	#   t.datetime "updated_at", null: false
	#   t.string "spotify_uri"
	#   t.string "name"
	#   t.index ["user_id"], name: "index_playlists_on_user_id"
	# end
	def setup
		@playlist = []
		@playlist = Playlist.new(user_id: "string", spotify_id: "string",
										 name: '"index_playlists_on_user_id"')
	end

	test "playlist has a name assigned by user" do
    @playlist.name = ""
    assert @playlist.save
  end
	# HAS SPOTIFY URI, AN EMBED STRING AND A NAME
	test "playlist has user's user id (indexed to user_id)" do		# spotify:user:usernamehere
		@playlist.spotify_uri
		assert @playlist.assert_includes(user_id)
	end

	test "each playlist has embed string" do
		@playlist.each.assert_includes(		https://open.spotify.com/track/*
		)
	end

	test "new songs can be added to playlist" do
		@playlist << ("https://open.spotify.com/track/*")
	end

	test "new songs can be deleted from playlist" do
		@playlist << ("https://open.spotify.com/track/*
		").remove
	end

	test "playlist can be added to cart as cart_item" do
		@cart_item << @playlist
	end

	test "playlist contains at least one song before it can be added as cart_item" do
		@playlist.assert_not_empty.index_playlists_on_user_id
		@playlist.assert_not_empty
		@playlist.each > 0
	end

	test "playlist name is a string" do
		@playlist.name = ""
	end

	test "order of songs in playlist can be rearranged" do
		@playlist.range_start.is_a(Integer)
		@playlist.range_start
		@playlist.insert_before
	end

	# Per Spotify's terms of use, this feature is necessary - design recources at link in below link
	test "playlist shows image of album of each item" do
		@playlist.include_album_image
		@playlist.include_album_image = *.png
	end

	test "playlist shows song title of each item as string" do
		@playlist.include_title_name
		@playlist.include_title_name = ""
	end

	test "playlist shows artist name of each item as string" do
		@playlist.include_artist_name
		@playlist.include_artist_name = ""
	end

	test "playlist shows album name of each item as string" do
		@playlist.include_album_name
		@playlist.include_album_name = ""
	end
end
