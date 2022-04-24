Rails.application.routes.draw do
  get "/home/about" => "homes#about", as: "about"
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy] do
 
  resource :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create, :destroy]
end
  
  resources :users, only: [:show, :edit, :update, :index]
  root to: "homes#top"
end
