class ProductsController < ApplicationController
  layout "store"
  before_filter do
    if params[:category_id]
      @product_category = Shoppe::ProductCategory.where(:permalink => params[:category_id]).first!
    end
    if @product_category && params[:product_id]
      @product = @product_category.products.where(:permalink => params[:product_id]).active.first!      
    end
  end
  
  def index
    @products = @product_category.products.includes(:default_image, :product_categories, :variants).root.active.page(params[:page]).per(30)
    @counts = @product_category.products.includes(:default_image, :product_categories, :variants).active.count
  end


  def add_comment

  end


  def compare
  end

  def filter
    @products = Shoppe::Product.active.with_attributes(params[:key].to_s, params[:value].to_s)
  end
  
  def categories
    @product_categories = Shoppe::ProductCategory.ordered.includes(:image)
  end
  
  def show
    @attributes = @product.product_attributes.publicly_accessible.to_a
    @comment = Comment.new
    @comments = Comment.where(:product_id => @product.id).reverse_order
    @planter = Planter.find_by_name(@product.name)
  end
  
  def add_to_basket
    product_to_order = params[:variant] ? @product.variants.find(params[:variant].to_i) : @product
    current_order.order_items.add_item(product_to_order, params[:quantity].blank? ? 1 : params[:quantity].to_i)
    respond_to do |wants|
      wants.html { redirect_to request.referer , :notice => t('alerts.products.add_to_basket') }
      wants.json { render :json => {:added => true} }
    end
  rescue Shoppe::Errors::NotEnoughStock => e
    respond_to do |wants|
      wants.html { redirect_to request.referer, :notice => t("alerts.products.not_enough_1 #{e.available_stock} alerts.products.not_enough_2") }
      wants.json { render :json => {:error => 'NotEnoughStock', :available_stock => e.available_stock}}
    end
  end
  
end
