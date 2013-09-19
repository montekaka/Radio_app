RadioApp::Application.routes.draw do
  get "admin/login"

  get "admin/logout"

  get "admin/dropbox_authorized"

  get "admin/main"

  get "abouts/home"

  get  "dropbox/main"
  post "dropbox/upload"
  post "dropbox/create"
  get  "dropbox/auth_start"
  get  "dropbox/auth_finish"
  get  "dropbox/testing"
  get  "dropbox/reset"

  resources :stations do
    resources :shows do
        get 'categories', :on => :collection #add for route: stations/:station_id/shows/categories
    end
  end

  devise_for :users , :controllers => { :registrations => "registrations" }
  resources :users, :only => [:show]

  resources :shows do
      resources :audioposts      
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'stations#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
