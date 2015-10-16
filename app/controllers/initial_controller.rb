class InitialController < ApplicationController

  before_action :authenticate_user! , except: [:home, :forgot_password, :mail_new_pass, :shop, :introduce,:services]

  respond_to :html, :js
  # protect_from_forgery with: :null_session
  def forgot_password

  end

  def mail_new_pass
      @email_address = params[:address]
      if User.find_by_email(@email_address).present?
        ForgotPasswordMailer.forgot_mail_sender(@email_address).deliver
      else
        redirect_to new_user_registration_path , :alert => "شما قبلا ثبت نام نکرده اید، از طریق فورم زیر عضو گلوگرام شوید"
      end
  end
    
  def home
    users = User.order("sign_in_count DESC")

    for x in users do
      if x.profile.present?
        @guy = x.profile
        break
      end
    end

  end

  def shop
    @products = Shoppe::Product.active.featured.includes(:default_image, :product_categories, :variants).root
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  
  def search
  end

  def introduce

  end

  def services
    @section = 0;
    page_state = params[:section]
    if page_state == 1.to_s
      @section = 1
    end
    if page_state == 2.to_s
      @section = 2
    end
    if page_state == 3.to_s
      @section = 3
    end
    if page_state == 4.to_s
      @section = 4
    end
    if page_state == 5.to_s
      @section = 5
    end
    if page_state == 6.to_s
      @section = 6
    end
  end

  def do_search
    q = params[:query]
    # @result = Planter.find_by_name(q);
    # @result = Profile.find_by_first_name(q);
    # @result = Profile.where('first_name LIKE ?' , '%params[:query]%')
    @result = Profile.where("first_name LIKE :name1 OR last_name LIKE :cityId1", {:name1 => "#{params[:query]}%", :cityId1 => "#{params[:query]}%"})
    # @result = @result + Planter.where("name LIKE :name1 OR latin_name LIKE :cityId1 OR second_name LIKE :name3", {:name1 => "#{params[:query]}%", :cityId1 => "#{params[:query]}%", :name3 => "#{params[:query]}" } )
    # byebug
    # respond_to do |f|
      # f.js
    # end
  end


end
