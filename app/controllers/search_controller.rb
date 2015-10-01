class SearchController < ApplicationController
  layout "store"


  def shop_search

    if params[:query].present? and params[:query] != ""
      term = params[:query]
      @result = Shoppe::Product.active.
          where("name LIKE ? OR permalink LIKE ? OR description LIKE ? OR short_description LIKE ?","%#{term}%", "%#{term}%", "%#{term}%", "%#{term}%")

      puts @result.size

      @result2 =  Shoppe::ProductCategory.all.
          where("name LIKE ? OR permalink LIKE ? OR description LIKE ?","%#{term}%", "%#{term}%", "%#{term}%")
    else
      redirect_to :back
    end

  end

end
