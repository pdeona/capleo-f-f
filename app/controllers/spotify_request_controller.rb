class SpotifyRequestController < ApplicationController
  include SpotifyRequestHelper

  before_action :log_in

  def search
    query = params[:search]
    @response = RSpotify::Track.search(query)
    parse_response
    redirect_to products_path
  end

end
