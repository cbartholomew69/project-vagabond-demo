Rails.application.routes.draw do

  
  resources :cities do
    resources :posts
  end

  devise_for :users

  root 'application#home'

  get 'users/:id', to: 'users#show', as: 'user'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end