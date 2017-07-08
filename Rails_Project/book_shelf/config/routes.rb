Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#   get "users" => 'users#index'
#   get "users/new" => 'users#new'
#   get "users/:id" => 'users#show'
#   get "users/:id/edit" => 'users#edit'
#   post "users" => 'users#create'
#   put "users/:id" => 'users#update'
#   delete "users/:id" => 'users#destroy'

#   # get "posts" => 'posts#index'
#   # get "posts/new" => 'posts#new'
#   # get "posts/:id" => 'posts#show'
#   # get "posts/:id/edit" => 'posts#edit'
#   # post "posts" => 'posts#create'
#   # put "posts/:id" => 'posts#update'
#   # delete "posts/:id" => 'posts#destroy'

# resource :posts, only: [:index,:edit,:create, :update]
# resources :post do
# 	collection do 
# 		get 'most_like'
# 	end
# 	resources :comments do
		
# 		resources :users

# 	end

# end


resources :users
root 'users#index'

# resources :post do
# 	collection do 
# 		get 'most_like'
# 	end
# 	member do
# 		get 'most_comment'
# 	end
# 	# resources :comments do
# 	# 	# resources :users
# 	# end

# end

end
