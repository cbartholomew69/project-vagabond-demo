Rails.application.routes.draw do

  resources :cities do
    resources :posts
  end

# get 'cities/:city_id/posts/new', to: 'posts#new', as: 'post_new'

# post 'cities/:city_id/posts', to: 'posts#create', as: 'post_create'

# get '/cities/:id', to: 'cities#show', as: 'city'

# get 'cities/:id/posts/:id', to: 'posts#show', as: 'post'

root 'application#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
