UserManager::Application.routes.draw do

  resources :roles do
    get "list", :on => :collection
  end

  resources :accttypes do
    get "list", :on => :collection
  end

  resources :sshkeys do
    get "list", :on => :collection
  end

  resources :environments do
    get "list", :on => :collection
  end

  resources :uids do
    get "list", :on => :collection
  end

  resources :users do
    get "list", :on => :collection
    get "create_account", :on => :collection
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'users#index'

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

  #get "/users/:id/reset_password" => 'users#reset_password', :as => :users_reset_password

  #omniauth stuff
  post "/auth/:provider/callback" => "sessions#create"
  get "/auth/:provider/callback" => "sessions#create"
  get "/signout" => "sessions#destroy", :as => :signout

  #reset password patch
  patch '/users/:id/do_password_reset' => 'users#do_password_reset'
  get '/users/:id/reset_password' => 'users#reset_password', :as => :users_reset_password


end
