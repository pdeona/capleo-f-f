module ProductsHelper

  # a method to determine if products in the db match the search term; whichever yields the most results is returned
  # if neither returns results the index is displayed as normal
  def search_helper
    possible_products_one = Product.order(:name).where("name like ?", "%#{session[:search]}%").paginate(page: params[:page])
    possible_products_two = Product.order(:name).where("artist like ?", "%#{session[:search]}%").paginate(page: params[:page])
    unless possible_products_one == 0 && possible_products_two == 0
      return (possible_products_one.size >= possible_products_two.size ? possible_products_one : possible_products_two)
    else
      Product.order(created_at: :asc)
    end
  end

end
