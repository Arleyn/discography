Rails.application.routes.draw do
  root :to => "welcome#index"

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

  # Artist
  get 'artist/dashboard', to: 'artist#dashboard', as: 'artist_dashboard'
  get 'artist/new', to: 'artist#new', as: 'artist_new'
  post 'artist/new', to: 'artist#create'
  get 'artist/:id/delete', to: 'artist#delete', as: 'artist_delete'
  get 'artist/:id/edit', to: 'artist#edit', as: 'artist_edit'
  patch 'artist/:id/update', to: 'artist#update', as: 'artist_update'

  # LP
  get 'lp/dashboard', to: 'lp#dashboard_filter', as: 'lp_dashboard_filter'
  post 'lp/dashboard', to: 'lp#dashboard_filter_result', as: 'lp_dashboard_filter_result'
  get 'artist/:id_artist/lp', to: 'lp#dashboard', as: 'lp_dashboard'
  get 'artist/:id_artist/lp/new', to: 'lp#new', as: 'lp_new'
  post 'artist/:id_artist/lp/new', to: 'lp#create'
  get 'artist/:id_artist/lp/:id/delete', to: 'lp#delete', as: 'lp_delete'
  get 'artist/:id_artist/lp/:id/edit', to: 'lp#edit', as: 'lp_edit'
  patch 'artist/:id_artist/lp/:id/update', to: 'lp#update', as: 'lp_update'
end
