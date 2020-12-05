Rails.application.routes.draw do
  get 'workshops/new'
  get 'workshops/create'
  get 'workshops/index'
  get 'workshops/show'
  get 'workshops/edit'
  get 'workshops/update'
  get 'workshops/destroy'
  # Root path
  # root to: 'pages#home'
  root to: 'users#index'
  
  # Create routes for users
    # users     GET    /users(.:format)          users#index
    #           POST   /users(.:format)          users#create
    # new_user  GET    /users/new(.:format)      users#new
    # edit_user GET    /users/:id/edit(.:format) users#edit
    # user      GET    /users/:id(.:format)      users#show
    #           PATCH  /users/:id(.:format)      users#update
    #           PUT    /users/:id(.:format)      users#update
    #           DELETE /users/:id(.:format)      users#destroy
  resources :users

  # Login/logout routes
  get '/login'  => 'session#new'        # showing the login form
  post '/login' => 'session#create'     # form submits to here, performs login, redirects
  delete '/login' => 'session#destroy'  # logout link goes here, perform logout, redirect
end
