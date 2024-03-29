HatSim::Application.routes.draw do

  resources :reviews

  # For the team url's
  resources :teams
  get 'teams/:id/join', to: 'teams#join', as: 'join_team'
  get 'teams/:id/reject', to: 'teams#reject', as: 'reject_team'
  get 'teams/:id/play', to: 'teams#play', as: 'team_play'

  # For ransack's search path
  resources :tf2_servers do
    collection do
      match 'search' => 'tf2_servers#search', via: [:get, :post], as: :search
    end
  end

  # For the server paths
  resources :tf2_servers
  get 'tf2_servers/:id/join', to: 'tf2_servers#join', as: 'join_tf2_server'
  get 'tf2_servers/:id/leave', to: 'tf2_servers#leave', as: 'leave_tf2_server'
  get 'tf2_servers/:id/ready', to: 'tf2_servers#ready', as: 'ready_tf2_server'

  # For devise routes:
  devise_for :users, :path => '', :path_names => { :sign_in => "signin", :sign_out => "signout", :sign_up => "register" }

  # The static pages:
  root 'static_pages#home'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/faq',     to: 'static_pages#faq',     via: 'get'

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
end
