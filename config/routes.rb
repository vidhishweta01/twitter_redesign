Rails.application.routes.draw do
  root 'tweets#index'
  get 'followings/create'
  get 'followings/destroy'
  devise_for :users
  resources :users, only: [:index, :show]
  resources :tweets, only: [:index, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
