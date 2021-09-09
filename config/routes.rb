Rails.application.routes.draw do
  resources :posts do
    resources :comments, only: %i[new create destroy], module: :posts
  end
  resources :comments, only: [] do
    resources :comments, only: %i[new create destroy], module: :comments
  end
  devise_for :users
  root "dashboard#index"
  get 'dashboard/index'
end
