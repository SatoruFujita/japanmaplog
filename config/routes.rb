Rails.application.routes.draw do
  resources :users
  get 'pages/index'
  root 'pages#index'
end
