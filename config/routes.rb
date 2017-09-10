Rails.application.routes.draw do
  # tattooshop내 post들 
  post 'images/main_image'
  post 'images/shop_image'
  post 'images/tattoo_image'
  post 'images/design_image'
  post 'images/greeting'
  post '/images/fullmanages'
  post '/images/limited'
  get 'images/destroy_designimg/:shopdesignimg_id' => 'images#destroy_designimg'
  get 'images/destroy_tattooimg/:shoptattooimg_id' => 'images#destroy_tattooimg'
  get 'images/destroy/:shopdesignimg_id' => 'images#destroy_designimg'
  get 'images/destroy_shopshopimg/:shopshopimg_id' => 'images#destroy_shopshopimg'
  post 'images/update_designimg' => 'images#update_designimg'
  post 'images/update_shopshopimg' => 'images#update_shopshopimg'
  post 'images/update_tattooimg' => 'images#update_tattooimg'
  get 'home/search'
  #리뷰 관련
  post 'review/write_review'
  get 'review/edit/:review_id' => 'review#edit'
  get 'review/update/:review_id' => 'review#update'
  get 'review/destroy/:review_id' => 'review#destroy'
  post 'review/write_rereview'
  #comment
  post 'review/write_shoptattoocomment'
  post 'review/write_shopdesigncomment'
  #에러
  get 'images/error'
  #like
  get 'like/likedesign/:id' => 'like#likedesign',  as: "like_design"
  get 'like/likereview/:id' => 'like#likereview', as: "like_review"
  get 'like/likeshop/:id' => 'like#likeshop', as: "like_shop"
  get 'like/likeshoptattoo/:id' => 'like#likeshoptattoo', as: "like_tattoo"
  # tattooshop making
  get 'tattooshops/new' 
  post 'tattooshops/create'
  get 'tattooshops/edit/:tattooshop_id' => 'tattooshops#edit'
  post 'tattooshops/update/:tattooshop_id' => 'tattooshops#update'
  get '/tattoshops/destroy/:tattooshop_id' => 'tattooshops#destroy'
  post 'images/profile'
  get 'home/search'
  get 'home/index'
  root 'landing#index'
  get 'member/message'
  get 'member/wishlist'
  get 'member/picture'
  get 'member/help'
  get 'tattooshop/:shop_id' => 'home#shop_show'
  get 'member/follow/:user_id' => 'member#follow'
  get 'member/unfollow/:user_id' => 'member#unfollow'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
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
