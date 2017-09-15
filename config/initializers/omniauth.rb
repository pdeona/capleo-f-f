require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, '3b7f09ba4fdf4d0aa23cb0c22c51b0b4', '90ed0683d365472cba784a93509481c0', scope: 'playlist-modify-public playlist-modify-private user-library-modify'
end
