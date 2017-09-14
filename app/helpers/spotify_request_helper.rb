module SpotifyRequestHelper

  def parse_response
    if @response
      @response.each do |track|
        Product.create(name: track.name, artist: track.artists[0].name, spotify_id: track.id)
      end
    end
  end

end
