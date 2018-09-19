Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations'}
  resources :intros
  resources :settings
  # resources :messages
  resources :faqs
  resources :posts
  resources :pages
  resources :users

  ActiveAdmin.routes(self)
  root 'home#index'
  get 'home/index'
  get 'splash' => "home#splash"
  get 'sample' => "home#sample"
  get 'intro' => "home#intro"
  get 'ajax_test' => "home#ajax_test"
  get 'remote_test' => "home#remote_test"
  get 'main' => "home#main"
  get 'tabs' => "home#tabs"
  get 'test' => "home#test"

  get "page/:page" => "home#page"
  # get 'messages' => "home#messages"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
