﻿Rails.application.routes.draw do
  resources :how_tos
  get 'how_to/index'

  get 'set/index'

  get 'login/index'

  post 'login/auth'

  get 'top/index'

  get 'tags/index'


  resources :allusers do
    post 'search_user', on: :collection
  end

  resources :categories 

  resources :items do
    get 'show_image', on: :member
    get 'show_image2', on: :member
    get 'show_image3', on: :member
    get 'search_tag', on: :collection
    get 'search_category', on: :collection
    get 'search_favcategory', on: :collection
    get 'search_wantcategory', on: :collection
    get 'wantcateg', on: :collection
    get 'favcateg', on: :collection
    get 'favindex', on: :collection
    get 'wantindex', on: :collection
    get 'skey_index', on: :collection
    get 'stag_index', on: :collection
    post 'search_key', on: :collection
    post 'alert', on: :collection
  end

  resources :users do
   get 'color', on: :member
   
  end

  resources :how_tos do
    get 'show_image', on: :member
    get 'show_image2', on: :member
    get 'show_image3', on: :member
    post 'upcount', on: :collection

  end

  resources :sets do
    post 'userdelete', on: :collection
  end

  
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
