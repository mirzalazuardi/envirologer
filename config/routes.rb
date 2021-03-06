Rails.application.routes.draw do
  get 'latest/:station_number' => 'publicvars#latest'

  devise_for :users
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  get 'dashboards' => 'dashboards#index', as: :dashboards
  get  'dashboards/latest_chart_data' => 'dashboards#latest_chart_data'
  get  'dashboards/latest/:component' => 'dashboards#latest_chart_channel_component_data', as: :latest_chart_component_data
  get 'aqmesh_data/grab' => 'aqmesh_data#grab'
  get 'aqmesh_data/latest_timestamp/:n' => 'aqmesh_data#latest_timestamp'
  get 'aqmesh_channels/latest/:n/:label' => 'aqmesh_channels#latest_final'
  resources :aqmesh_channels
  resources :aqmesh_data
  get 'units/grab' => 'units#grab'
  get 'sensors/grab' => 'sensors#grab'
  resources :stations
  resources :servers
  resources :units
  resources :sensors

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
