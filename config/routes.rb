Rails.application.routes.draw do
  root 'sessions#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/signup', to: 'users#new' 
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show'

end
