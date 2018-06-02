Rails.application.routes.draw do
  devise_for :users
  resources :articles, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:new, :create, :index, :update]
  end
  resources :categories, only: [:show]
  resources :editors, only: [:index]
  root controller: :articles, action: :index
end
