SampleApp::Application.routes.draw do
  resources :pictures

  devise_for  :users, :controllers => {
    :registrations => "registrations"
  }
  resources :microposts,    only:[:create,   :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :users, only: [:show, :index] do

    member do
      get :following, :followers
    end
  end
  
  resources :microposts, only: [:create, :destroy]
  resources :categories, only: [:create, :new,:destroy] do
    # collection do
    #   get :form
    # end
  end
  root  'static_pages#home'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  get "users/show"
  get "static_pages/home"
  get "static_pages/help"
  get "static_pages/about"
  get "static_pages/contact"
  get 'inquiry' => 'inquiry#index'
  get 'inquiry/confirm' => 'inquiry#confirm'
  post 'inquiry/confirm' => 'inquiry#confirm'
  post 'inquiry/thanks' =>'inquiry#thanks'
  get 'forms/index' => 'forms#index'
  get 'forms/find' => 'forms#find'
  get 'forms/select' => 'forms#select'
  # get 'categories/form' =>'categories#form'
  # post 'categories/create' =>'categories#create'
  # get 'categories/create' =>'categories#create'
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