module ProductsHelper

  # a method to determine if products in the db match the search term; whichever yields the most results is returned
  # if neither returns results the index is displayed as normal
  def search_helper query
    possible_products_one = Product.order(:name).where("name like ?", "%#{query}%")
    possible_products_two = Product.order(:name).where("artist like ?", "%#{query}%")
    # byebug
    if possible_products_one.size == 0 && possible_products_two.size == 0
      flash[:danger] = "No songs matched your search. Try a song title or an artist's name."
      Product.order(created_at: :asc).paginate(page: params[:page])
    else
      if possible_products_one.size >= possible_products_two.size
        possible_products_one.paginate(page: params[:page])
      else
        possible_products_two.paginate(page: params[:page])
      end
    end
  end

end
