Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :users, controllers: {
    registraions: 'users/registrations',
    sessions: 'users/sessions',
  }
  resources :posts, only: [:index, :create]
  resources :comments, only: [:create]
end
