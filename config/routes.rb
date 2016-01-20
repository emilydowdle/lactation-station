Rails.application.routes.draw do
  root 'welcome#index'

  resources :welcome, only: [:index]
  resources :home, only: [:index]
  get 'drugs/search', to: 'drugs#search_by_name'
  get 'drugs/search-name', to: 'drugs#search_by_name'
  get 'drugs/search-usage', to: 'drugs#search_by_usage'
  resources :drugs, only: [:index, :show], param: :name
  get 'profile', to: 'profile#show'
  resource :status, controller: :status, only: [:create]

  get '/auth/twitter', as: :login
  get '/auth/twitter/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  namespace :api do
    namespace :v1 do
      resources :searches, only: [:index, :create], defaults: { format: :json }
      resources :drugs, only: [:index, :show], param: :name, defaults: { format: :json }
      get 'drugs/letter_match/:letter', to: 'drugs#letter_match', defaults: { format: :json }
    end
  end

  get '*path', to: 'home#index'
end
