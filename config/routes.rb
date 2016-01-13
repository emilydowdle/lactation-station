Rails.application.routes.draw do
  root 'welcome#index'

  resources :welcome, only: [:index]
  resources :home, only: [:index]
  get 'drugs/search', to: 'drugs#search'
  resources :drugs, only: [:index, :show]

  get '/auth/twitter', as: :login
  get '/auth/twitter/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
