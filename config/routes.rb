BackChannelApp::Application.routes.draw do
  get '/welcome'  => 'welcome#index'

  get '/user/signup' => 'users#user_sign_up'
  post '/user/signup' => 'users#create_user'

  get '/user/signin' => 'users#signin',:as => :sign_in
  post '/user/signin' => 'users#authenticate_user'

  get '/user/kp' => 'users#signin'
  get '/user/signout' => 'users#logout'


  get '/post/:id' => 'posts#show', :as =>:show_post

  get '/post/like/:post_id' => 'post_votes#like_post', :as => 'like_post'
  get '/post/unlike/:post_id' => 'post_votes#unlike_post', :as => 'unlike_post'

  get '/posts/show/report' => 'posts#report', :as => 'report'
  get '/comment/like/:comment_id' => 'comment_votes#like_comment', :as => 'like_comment'
  get '/comment/unlike/:comment_id' => 'comment_votes#unlike_comment', :as => 'unlike_comment'

  get '/comment/delete/:id' => 'comments#destroy', :as=>'delete_comment'
  #post '/post/comment/:post_id' => 'comments#create' , :as => 'comment'
  #get '/post/comment/:post_id' => ''
  #post '/user_sign-up' =>
  get '/user/signin' => 'users#signin'
  get '/search' => 'posts#search'

  root :to => 'welcome#index'

  resources :reply_votes

  resources :replies

  resources :comment_votes

  resources :comments

  resources :post_votes

  resources :posts


  resources :categories

  resources :users


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
  #map.root :controller => 'UsersController' , :action => :index
end
