Rails.application.routes.draw do
  get 'resumes/index'

  get 'resumes/new'

  get 'resumes/create'

  get 'resumes/destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get "users" => 'users#index'
  # get "users/new" => 'users#new'
  # get "users/:id" => 'users#show'
  # get "users/:id/edit" => 'users#edit'
  # post "users" => 'users#create'
  # put "users/:id" => 'users#update'
  # delete "users/:id" => 'users#destroy'

#   # get "books" => 'books#index'
#   # get "books/new" => 'books#new'
#   # get "books/:id" => 'books#show'
#   # get "books/:id/edit" => 'books#edit'
#   # post "books" => 'books#create'
#   # put "books/:id" => 'books#update'
#   # delete "books/:id" => 'books#destroy'

# resource :books, only: [:index,:edit,:create, :update]
# resources :post do
# 	collection do 
# 		get 'most_like'
# 	end
# 	resources :comments do
    
# 		resources :users

# 	end

# end

# resources :post do
#   collection do 
#     get 'most_like'
#   end
#   member do
#     get 'most_comment'
#   end
#   # resources :comments do
#   #   # resources :users
#   # end

# end



resources :resumes, only: [:index, :new, :create, :destroy]
get "books/items"
get "books/search"
get  '/register',  to: 'users#new'

get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
get '/logout' => 'sessions#destroy'
get '/signup' => 'users#new'
# get "login"
root "books#items"
resources :users
# root 'users#index'
resources :orders
resources :carts
resources :books
resources :account_activations, only: [:edit]

end

