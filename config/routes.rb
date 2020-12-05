Rails.application.routes.draw do
  get 'tasks/new'
  get 'tasks/create'
  get 'tasks/index'
  get 'tasks/show'
  get 'tasks/edit'
  get 'tasks/update'
  get 'tasks/destroy'
  # Root path
  # root to: 'pages#home'
  root to: 'workshops#index'
  
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

  # Create routes for workshops
  #   workshops   GET    /workshops(.:format)          workshops#index
  #               POST   /workshops(.:format)          workshops#create
  #  new_workshop GET    /workshops/new(.:format)      workshops#new
  # edit_workshop GET    /workshops/:id/edit(.:format) workshops#edit
  #      workshop GET    /workshops/:id(.:format)      workshops#show
  #               PATCH  /workshops/:id(.:format)      workshops#update
  #               PUT    /workshops/:id(.:format)      workshops#update
  #               DELETE /workshops/:id(.:format)      workshops#destroy
  resources :workshops
end
