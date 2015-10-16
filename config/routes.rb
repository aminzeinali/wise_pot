Rails.application.routes.draw do

  resources :search do
    collection do
      get :shop_search
      get :main_search
    end
  end



  resources :survey_ideas

  resources :bluetooth_devices

  get 'store/show'

  devise_for :users, controllers: { registrations: 'user_registrations' }
  devise_scope :user do
    root :to =>"initial#home"
  end


  require 'api_constraints'
  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :planters
      resources :gardens
      resources :profiles
      resources :users, :only => [:show, :create, :update, :destroy]
      resources :sessions, :only => [:create , :destroy]
    end
    scope module: :v2, constraints: ApiConstraints.new(version: 2) do
      resources :planters
    end
  end
  resources :comments

  resources :data_logs do
    collection do
      get :reciever
    end
  end

  resources :images

  resources :posts

  resources :planters do
    member do
      get :follow
      get :unfollow
    end
  end

  resources :plants do
    member do
      get :vote_up
      get :del_vote_up
    end
  end

  resources :gardens

  resources :profiles do
    member do
      get :my_devices
      get :my_gardens
      get :about_me
      get :my_accounts
    end
  end

  resources :initial do
    collection do
      get :do_search
      get :forgot_password
      get :mail_new_pass
      get :shop
      get :introduce
      get :services
    end
  end

  # get '/search' , to: 'initial#search'

  # get '/dosearch' , to: 'initial#do_search'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  #
  # Product browising
  #
  get 'products' => 'products#categories', :as => 'catalogue'
  get 'products/filter' => 'products#filter', :as => 'product_filter'
  get 'products/:category_id' => 'products#index', :as => 'products'
  get 'products/:category_id/:product_id' => 'products#show', :as => 'product'
  post 'products/:category_id/:product_id/buy' => 'products#add_to_basket', :as => 'buy_product'


  #
  # Order status
  #
  get 'order/:token' => 'orders#status', :as => 'order_status'

  #
  # Basket
  #
  get 'basket' => 'orders#show', :as => 'basket'
  delete 'basket' => 'orders#destroy', :as => 'empty_basket'
  post 'basket/:order_item_id' => 'orders#change_item_quantity', :as => 'adjust_basket_item_quantity'
  delete 'basket/:order_item_id' => 'orders#change_item_quantity'
  delete 'basket/delete/:order_item_id' => 'orders#remove_item', :as => 'remove_basket_item'

  #
  # Checkout
  #
  match 'checkout' => 'orders#checkout', :as => 'checkout', :via => [:get, :patch]
  match 'checkout/delivery' => 'orders#change_delivery_service', :as => 'change_delivery_service', :via => [:post]
  match 'checkout/pay' => 'orders#payment', :as => 'checkout_payment', :via => [:get, :patch]
  match 'checkout/confirm' => 'orders#confirmation', :as => 'checkout_confirmation', :via => [:get, :patch]

  #
  # Static pages
  #
  # get ':action', :controller => 'pages', :as => 'page'

  #
  #compare
  #


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Shoppe::Engine => "/store"

  match "/compare/new" => "compare#add_object", :as => 'add_object' , :via => :get
  match "compare/show" => "compare#show" , :as => 'show_list' , :via  => :get

end
