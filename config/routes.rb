Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations'}

  resources :posts
  resources :users

  ActiveAdmin.routes(self)
  root 'home#index'
end
