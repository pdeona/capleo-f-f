require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, '3b7f09ba4fdf4d0aa23cb0c22c51b0b4', ENV[:client_secret_spotify], scope: 'playlist-modify-public playlist-modify-private user-library-modify'
end
