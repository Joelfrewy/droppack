Rails.application.routes.draw do
  Spree::Core::Engine.routes.draw do
    resources :vendors, param: :slug
    get 'vendors/new'
    get 'vendors/create'
    get 'vendors/update'
    get 'vendors/destroy'
    get 'vendors/index'
    get 'vendors/:slug', to: 'vendors#show'

    resources :users do
      member do
        get :subscribed
      end
    end

    resources :vendors do
      member do
        get :subscribers
      end
    end

    resources :subscriptions, only: [:create, :destroy]

    namespace :admin, path: "/admin"  do
      resources :vendors
      #get 'vendors/:slug/edit'
    end
  end
  # This line mounts Spree's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to
  # Spree::ProductsController.
  # If you would like to change where this engine is mounted, simply change the
  # :at option to something different.
  #
  # We ask that you don't use the :as option here, as Spree relies on it being
  # the default of "spree".
  mount Spree::Core::Engine, at: '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
