class InitialController < ApplicationController
  before_action :authenticate_user! , except: [:home, :forgot_password, :mail_new_pass]

  # protect_from_forgery with: :null_session
  def forgot_password

  end

  def mail_new_pass
      @email_address = params[:address]
      ForgotPasswordMailer.forgot_mail_sender(@email_address).deliver
  end
    
  def home
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

  def do_search
    q = params[:query]
    # @result = Planter.find_by_name(q);
    # @result = Profile.find_by_first_name(q);
    # @result = Profile.where('first_name LIKE ?' , '%params[:query]%')
    @result = Profile.where("first_name LIKE :name1 OR last_name LIKE :cityId1", {:name1 => "#{params[:query]}%", :cityId1 => "#{params[:query]}%"})
    # byebug
    # respond_to do |f|
      # f.js
    # end
  end


end
