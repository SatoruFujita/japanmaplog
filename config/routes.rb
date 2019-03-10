Rails.application.routes.draw do
  get 'hotel_search/home'
  get 'sessions/new'
  resources :users
  get 'pages/index'
  root 'pages#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
