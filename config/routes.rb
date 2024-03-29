Rails.application.routes.draw do
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'

  namespace :admin do
    resources :users do
  end
  end

  root to: 'communities#index'
  resources :communities
  resources :key_words
  resources :buy_users


  resources :talks, only: [:new, :index, :edit, :show] do
     delete '/word', to:'talks#destroy_talk'
   end

  resources :rooms do
    resources :talks, only: [:create, :destroy]
    get '/room_history', to:'buy_users#room_history'
  end
   get '/picture_index', to:'rooms#picture_index'

  resources :shop_users do
    get '/shop_show', to:'rooms#shop_show'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
