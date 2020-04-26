Rails.application.routes.draw do
  # devise_for :authors
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/login'
  get 'users/new'
  get 'users/create'
  get 'welcome/index'
  resources :articles do
    resources :comments
  end

  # resources :users, only: [:new, :create]
  # get 'login', to: 'sessions#new'
  # post 'login', to: 'sessions#create'
  # delete 'logout', to: 'sessions#destroy'
  
    devise_for :authors, controllers: {
      sessions: 'authors/sessions'
    }

  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
