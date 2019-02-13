Rails.application.routes.draw do
  resources :queries, only: [:index, :show, :create]
  resources :users, only: [ :index, :show ]

  post '/signup', to: 'users#create'
  post '/login', to: 'users#login'
  get '/user/queries', to: 'users#queries'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
