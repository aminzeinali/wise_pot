class StoreController < ApplicationController

  layout "store"
  before_action :authenticate_user! , :except => :show


  def show
    @products = Shoppe::Product.active.featured.includes(:default_image, :product_categories, :variants).root
  end


end
