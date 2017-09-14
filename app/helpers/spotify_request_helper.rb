module SpotifyRequestHelper

  def parse_response
    if @response
      @response.each do |track|
        Product.create(name: track.name, artist: track.artists[0].name, spotify_id: track.id)
      end
    end
  end
  # delete unused product items from db
  def clean_up
    @products = Product.all
    @products.each do |product|
      if product.cart_items_id == nil
        product.destroy
      end
    end
  end

end
