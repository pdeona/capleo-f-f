module ProductsHelper
  # delete unused products from db to avoid clutter
  def clean_up
    @products = Product.all
    @products.each do |product|
      if product.cart_items_id == nil
        product.destroy
      end
    end
  end
end
