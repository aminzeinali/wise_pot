class InitialController < ApplicationController
  before_action :authenticate_user! , except: :home

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
  
end
