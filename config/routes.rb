Rails.application.routes.draw do
  root to: "pages#home"

  get 'bikes/index'
  # get 'bikes/new'

  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/account', to: 'pages#account'

  get '/bookings', to: 'bookings#index'

  get '/near_me', to: 'bikes#near_me'

  # Defines the root path route ("/")
  # root "articles#index"

  resources :bikes, only: %i[index new create show update edit] do
    resources :bookings, only: %i[new create]
  end

  # resources :pages
end
