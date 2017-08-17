# nodoc
Rails.application.routes.draw do
  # get 'password_resets/new'

  # get 'password_resets/edit'

  # get 'password_reset/new'

  # get 'password_reset/edit'

  # get 'resumes/index'
  # get 'resumes/new'
  # get 'password_resets/new'

  # get 'password_resets/edit'

  # get 'password_reset/new'

  # get 'password_reset/edit'

  # get 'resumes/create'
  # get 'resumes/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get "users" => 'users#index'
  # get "users/new" => 'users#new'
  # get "users/:id" => 'users#show'
  # get "users/:id/edit" => 'users#edit'
  # post "users" => 'users#create'
  # put "users/:id" => 'users#update'
  # delete "users/:id" => 'users#destroy'
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

get "books/items"
get "books/search_book"
get "books/search"
get  '/register',  to: 'users#new'
get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
get '/logout' => 'sessions#destroy'
get '/signup' => 'users#new'
# get "login"

# resources :sessions, only: [:create, :new, :destroy]

root "books#items"
resources :users
resources :orders
resources :carts
resources :books
resources :account_activations, only: [:edit]
resources :password_resets, only: [:create, :new, :update, :edit]
end
