Rails.application.routes.draw do

  resources :cities do
    resources :posts
  end

  devise_for :users

  root 'application#home'

# get 'cities/:city_id/posts/new', to: 'posts#new', as: 'post_new'

# post 'cities/:city_id/posts', to: 'posts#create', as: 'post_create'

# get '/cities/:id', to: 'cities#show', as: 'city'

# get 'cities/:id/posts/:id', to: 'posts#show', as: 'post'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
