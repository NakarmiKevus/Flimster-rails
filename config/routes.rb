
Rails.application.routes.draw do
  root 'home#index'

  resources :movies, only: [:index, :show] do
    collection do
      get :search
    end

    resources :reviews, only: [:create, :edit, :update, :destroy]
  end

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new', as: 'signup'
  post 'signup', to: 'users#create'

  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
end
