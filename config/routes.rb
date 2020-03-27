Rails.application.routes.draw do
  root 'sessions#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/signup', to: 'users#new' 
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#logout'
  get '/auth/:provider/callback', to: 'sessions#create'
end
