Rails.application.routes.draw do
  devise_for :authors, :controllers => {:registrations => "authors/registrations", :sessions => "authors/sessions"}
  devise_for :users
  devise_for :admins
  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'application#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):

  resource :blogs, only: [:delete_selected_blogs] do
    post :delete_selected_blogs, as: :delete_selected
  end

  resources :blogs,     except: :destroy
  resources :enquiries, only: [:new, :create]
  resources :services,  only: [:index]
  resources :subcribes, only: [:create]

  namespace :authors, as: nil do
    resource :dashboard, only: [:my_post, :my_profile, :new_blog, :edit_blog] do
      get :my_blog,     as: :author_blogs
      get :my_profile,  as: :author_profile
      get :new_blog,    as: :new_blog
      get 'blogs/:blog_id/edit' => 'dashboards#edit_blog', as: :author_edit_blogs
    end
  end

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
