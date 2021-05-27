Rails.application.routes.draw do
  root 'tweets#index'
  get 'followings/create'
  get 'followings/destroy'
  devise_for :users
  resources :users, only: %i[index show]
  resources :tweets, only: %i[index create]
  resources :tweets, only: [:index, :create] do
    resources :likes, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
