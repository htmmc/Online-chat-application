Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}

  root 'pages#index'

  get 'talk' => 'pages#talk', as: :talk
  get 'listen' => 'pages#listen', as: :listen
  get 'about_us' => 'pages#about_us', as: :about_us
  get 'mission_statement' => 'pages#mission_statement', as: :mission_statement
  get 'terms_conditions' => 'pages#terms_conditions', as: :terms_conditions
  get 'listener_search' => 'pages#listener_search', as: :listener_search
  
  get 'contacts' => 'contacts#new'
  
  get 'users/chat_session(/:id)' => 'users#chat_session', as: :chat_session
  get 'users/feedback_user' =>'users#feedback_user', as: :feedback_user
  get 'users/feedback_listener' => 'users#feedback_listener', as: :feedback_listener
  get 'users/report_abuse_listener' =>'users#report_abuse_listener', as: :report_abuse_listener
  get 'users/report_abuse_user' => 'users#report_abuse_user', as: :report_abuse_user

  resources :users do
    member do
      put :ready
      put :busy
    end
  end

  resources :users
  resources "contacts", only: [:new, :create]

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
