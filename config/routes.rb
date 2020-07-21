Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, controllers: {
    registraions: 'users/registrations',
    sessions: 'users/sessions',
  }
end
