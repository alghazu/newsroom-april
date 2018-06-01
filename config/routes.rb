Rails.application.routes.draw do
  devise_for :users
  resources :articles, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:new, :create, :index] do
      patch :approve, action: :approve
    end
    patch :approve, action: :approve
  end
  resources :categories, only: [:show]

  namespace :dashboards do
    get :editor, action: :editor
  end

  root controller: :articles, action: :index
end
