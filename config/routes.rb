Aqualuks::Application.routes.draw do
  # get 'fresh', to: 'welcome#fresh'
  get "welcome/index"
  # get 'my_account', to: 'users#edit'

  # resources :users, only: [:update, :edit]
  # resource :session
  # resource :catalogue, only: [:show]
  # resources :orders, except: [:edit, :index, :destroy] do
  #   get 'empty_cart', on: :collection
  #   delete 'remove', on: :member
  # end
  # get '/confirm_order' => 'orders#confirm_order'
  # resources :products, only: [:show] do
  #   get 'add_to_cart', on: :member
  # end
  #
  # get '/login' => 'sessions#new'
  # match '/auth/:provider/callback' => 'sessions#create', via: [:get, :post]
  # get '/auth/failure' => 'sessions#failure'
  #
  # namespace :admin do
  #   get :dashboard, to: 'dashboards#index'
  #   resources :orders do
  #     get 'add_products', on: :member
  #     get 'find_products', on: :member
  #   end
  #   resources :products
  #   resources :categories
  # end

  root 'welcome#index'

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
