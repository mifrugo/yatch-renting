Rails.application.routes.draw do
  # User routes

  devise_scope :user do
    put '/users/avatar', to: 'update_users#update_avatar'
    put '/users/email', to: 'update_users#update_email'
    put '/users/password', to: 'update_users#update_password'
    get '/users/:id/yatchs', to: 'yachts#user_list', as: :yacht_user
  end

  devise_for :users

  # Homepage
  root to: 'pages#home'

  # Yatchs listing
  get     '/yachts',              to: 'yachts#index'
  # New yacht
  get     '/yachts/new',          to: 'yachts#new'
  post    '/yachts',              to: 'yachts#create'
  # Single yatch
  get     '/yachts/:id',          to: 'yachts#show', as: 'yacht'
  # Book a yatch
  post    '/yachts/:id',          to: 'yachts#book'

  # Update listing
  patch   '/yachts/:id',          to: 'yachts#edit'
  # Remove listing
  delete  '/yachts/:id',          to: 'yachts#destroy'
  # Update review
  patch   '/reviews/:id',         to: 'reviews#update'

  # Add to favorite
  #post    '/yatchs/:id/favorite', to: 'favorite#add'
  # Delete favorite
  #delete '/favorites/:id',       to: 'favorites#destroy'

  # Conversations list
  #get '/messages',               to: 'messages#list'
  # Single conversation
  #get '/messages/:id',           to: 'messages#show'
  # Add new message to conversation
  #post '/messages/:id',          to: 'messages#add'
end
