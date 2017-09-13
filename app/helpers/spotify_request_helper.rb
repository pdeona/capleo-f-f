module SpotifyRequestHelper
  CLIENT_ID = '3b7f09ba4fdf4d0aa23cb0c22c51b0b4'
  CLIENT_SECRET = '04670734b62e40b793de0fbf65cee33f'

  def log_in client_id = CLIENT_ID, client_key = CLIENT_SECRET
    RSpotify.authenticate(client_id, client_key)
  end

  def parse_response
    if @response
      @response.each do |track|
        Product.create(name: track.name, description: 'A groovy tune for you to jam to')
      end
    end
  end
end
