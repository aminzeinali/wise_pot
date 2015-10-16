class SearchController < ApplicationController
  layout "store" , :only => :shop_search


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



  def main_search

     if params[:query].present? and params[:query] != ""
      term = params[:query]
      @result = Profile.all.
          where("first_name LIKE ? OR last_name LIKE ? OR full_name LIKE ?","%#{term}%", "%#{term}%", "%#{term}%")

      # @result2 =  Shoppe::ProductCategory.all.
          # where("name LIKE ? OR permalink LIKE ? OR description LIKE ?","%#{term}%", "%#{term}%", "%#{term}%")
    else
      redirect_to :back
    end
  
  end


end
