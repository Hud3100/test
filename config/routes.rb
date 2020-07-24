Rails.application.routes.draw do
  root to: 'posts#index'
  get 'search' => 'search#index'
  devise_for :users, controllers: {
    registraions: 'users/registrations',
    sessions: 'users/sessions',
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :posts, only: [:index, :create]
  resources :comments, only: [:create]
end
