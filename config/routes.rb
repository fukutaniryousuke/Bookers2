Rails.application.routes.draw do
  
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:show, :edit, :update, :index]
  
  root to: "homes#top"
  get '/homes/about' => "homes#about", as: "about"
end
