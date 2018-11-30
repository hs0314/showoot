Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations'}

  #resources :posts

  #diary
  ##views
  get '/diary/index_post' => 'diary#index_post', as: 'index_posts'
  get '/diary/new_post' => 'diary#new_post', as: 'new_post'
  get '/diary/show_post/:id' => 'diary#show_post'
  post '/diary/create_post' => 'diary#create_post'
  post '/diary/edit_post/:id' => 'diary#edit_post'
  post '/diary/update_post/:id' => 'diary#update_post'
  delete '/diary/destroy_post/:id' => 'diary#destroy_post'
  get '/search/search' => 'search#search', as: 'search'
  get '/search/result' => 'search#result', as: 'result'



  ##ajax action
  get '/diary/pick_date' => 'diary#pick_date'



  root 'home#index'
end
