Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  get 'welcome/index'
  resources :articles do
    resources :comments
  end


  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end