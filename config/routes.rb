IBIS::Application.routes.draw do
  get "categories/index"

  get "admins/index"

  get "products/index"
  match "admins/category_management"=>"admins#category_management", :as=>"category_management"
  devise_for :users
  devise_for :admins

 # get "home/index"
  root :to => "home#index"
 # match "home/index"=>"home#index"
  match "/admins/sign_in" => 'devise/sessions#new'
  match "/admins/sign_out" =>  'devise/sessions#destroy'
  devise_for :admins do
    get "sign_in", :to => "devise/sessions#new"
    get "sign_in", :to => "devise/sessions#new"
    get "sign_up", :to => "devise/registrations#new"
    get "sign_up", :to => "admin/password/new"
    get "sign_out", :to => "devise/sessions#destroy"
  end


  # The priority is based upon order of creation:
  # first created -> highest priority.


    devise_for :users
  #do
    #get "sign_in", :to => "devise/sessions#new"
    #get "sign_in", :to => "devise/sessions#new"
    #get "sign_up", :to => "devise/registrations#new"
    #get "sign_up", :to => "users/password/new"
    #get "sign_out", :to => "sessions#destroy"
    #end

#devise_for :users, :controllers => {:confirmations => "confirmations", :registrations => "registrations"} do
#   put "confirm_account", :to => "confirmations#confirm_account"
    #match "home/save" => "home#save"
#end

  resources :products
  match  "products/unique_product/:id"=>"products#unique_product",:as=>"unique_product"
  match "products/destroy/:id"=>"products#destroy",:as=>"destroy_product"
  match "products/show_category"=>"products#show_category"
  match "products/show_sub_category"=>"products#show_sub_category"
   match "products/new"=>"products#new"
  resources :admins
  # get "admins/index"
   match "admins/destroy/:id"=>"admins#destroy",:as=>"destroy_category"

  resources :categories
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
