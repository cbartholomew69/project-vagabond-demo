Rails.application.routes.draw do

get 'cities/:city_id/posts/new', to: 'posts#new', as: 'post_new'

get '/cities/:id', to: 'cities#show', as: 'city'

get 'cities/:id/posts/:id', to: 'posts#show', as: 'post'

root 'application#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
