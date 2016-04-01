Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'main#index'
  resources :tpl, :only => [:index]

  get 'san-pham/:id' => 'main#product', as: :product
  get 'tat-ca-san-pham' => 'main#all', as: :all_products
  get 'tat-ca-san-pham/:page' => 'main#all', as: :all_products_page
  get 'loai-san-pham/:id' => 'main#all', as: :type
  get 'loai-san-pham/:id/:page' => 'main#all', as: :type_page
  get 'ket-qua-tim-kiem' => 'main#all', as: :search
  match '/lien-he', to: 'contacts#index', via: 'get', as: :contacts
  match '/lien-he', to: 'contacts#create', via: 'post', as: :contacts_post

  ################
  #     ADMIN
  ################
  namespace :admin do
    root to: 'page#index', via: :get
    resources :services
  end

  ################
  #     API
  ################

  namespace :api do
    scope :v1, module: 'v1', as: 'v1' do
      get 'api1'
      get 'api2'
      post 'api3'
      post 'api4'
    end
  end
  # get 'lien-he' => 'contacts#index', as: :contacts
  # post 'gui-thanh-cong' => 'contacts#success', as: :success
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
