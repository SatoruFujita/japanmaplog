Rails.application.routes.draw do
  get 'hotel_search/home'
  get 'sessions/new'
  resources :users
  resources :articles
  get 'pages/index'
  root 'pages#index'

  get 'articles/index' => 'articles'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


  post  'articles/create' => 'articles#create'
end
