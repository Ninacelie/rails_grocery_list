Rails.application.routes.draw do
  root 'sessions#home'
  
  #signup routes
  get '/signup', to: 'users#new' 
  post '/users', to: 'users#create'

  #login routes
  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'

  #users home page / show page 
  get '/users/:id', to: 'users#show'

  #logout routes
  post '/logout', to: 'sessions#logout'

  # omniauth
  get '/auth/:provider/callback', to: 'sessions#create_from_omniauth'

  resources :users do 
    resources :lists, only: [:new,:create,:index] # shallow routing 
  end 

  resources :lists do
    resources :items, only: [:new, :create, :index]
  end 

    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
