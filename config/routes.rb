Rails.application.routes.draw do

  get 'read_progress/create'
  get 'read_progress/update_progress'
  get 'read_progress/update_status'

  get 'bookmarks/create'
  post 'bookmarks/create'
  get 'bookmarks/destroy'
  post 'bookmarks/destroy'

  resources :post_imgs

  root    'read#index'

  get     'welcome'    =>  'splash#index'
  get     'compose' =>  'compose#index'

  post    'login'   => 'sessions#create'
  delete  'logout'  => 'sessions#destroy'

  get 'users/follow' => 'users#follow_list'
  get 'users/current' => 'users#current'
  get 'users/bookmarks' => 'users#bookmarks'
  get 'posts/recent' => 'posts#recent'
  get 'posts/top' => 'posts#top'
  get 'drafts' => 'posts#drafts'

  post 'follow/:id' => 'users#follow'
  delete 'unfollow/:id' => 'users#unfollow'
  get   'isfollowing/:id' => 'users#isfollowing'
  resources :posts

  resources :tags

  resources :users
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
