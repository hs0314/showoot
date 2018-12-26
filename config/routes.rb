Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations'}

  #diary
  get '/diary/index_post' => 'diary#index_post', as: 'index_posts'
  get '/diary/new_post' => 'diary#new_post', as: 'new_post'
  get '/diary/show_post/:id' => 'diary#show_post', as: 'show_post'
  post '/diary/create_post' => 'diary#create_post'
  post '/diary/edit_post/:id' => 'diary#edit_post'
  post '/diary/update_post/:id' => 'diary#update_post'
  delete '/diary/destroy_post/:id' => 'diary#destroy_post'
  get '/diary/pick_date' => 'diary#pick_date'

  #search
  get 'diary/search' => 'search#result', as: 'diary_search'


  #my page
  get '/mypage/index' => 'mypage#index', as: 'index_mypage'
  get '/mypage/category' => 'mypage#category', as: 'category'

  #lookbook
  get '/lookbook/index' => 'lookbook#index', as: 'index_lookbook'
  get '/lookbook/like/:id' => 'lookbook#likes', as: 'like_lookbook'

  root 'home#index'
end
