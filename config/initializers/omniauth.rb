require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, CLIENT ID, CLIENT SECRET, scope: 'playlist-modify-public playlist-modify-private user-library-modify'
end
