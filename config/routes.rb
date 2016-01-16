Rails.application.routes.draw do
  root 'welcome#index'

  resources :welcome, only: [:index]
  resources :home, only: [:index]
  get 'drugs/search', to: 'drugs#search_by_name'
  get 'drugs/search-name', to: 'drugs#search_by_name'
  get 'drugs/search-usage', to: 'drugs#search_by_usage'
  resources :drugs, only: [:index, :show], param: :name

  get '/auth/twitter', as: :login
  get '/auth/twitter/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  namespace :api do
    namespace :v1 do
      resources :drugs, only: [:index, :show], param: :name, defaults: { format: :json }
    end
  end
end
