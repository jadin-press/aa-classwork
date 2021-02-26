Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :artworks, only: :index
  end

  resources :artworks
  resources :artwork_shares, only: [:create, :destroy]
  # get 'users', to: 'users#index'
  # get 'users/:id', to: 'users#show'
  # post 'users', to: 'users#create'
  # get 'users/new', to: 'users#new'
  # patch 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy'
end
