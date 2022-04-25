Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  get "/home/about" => "homes#about", as: "about"
  get '/search', to: 'searches#search'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy] do
 
  resource :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create, :destroy]
end
  
  resources :users, only: [:show, :edit, :update, :index] do
  
  resource :relationships, only: [:create, :destroy]
  get 'followings' => 'relationships#followings', as: 'followings'
  get 'followers' => 'relationships#followers', as: 'followers'
end
  root to: "homes#top"
end
