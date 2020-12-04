Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
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
end
