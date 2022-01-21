Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/dashboard" ,to: "users#index"
  get "/personalpage" ,to: "users#personalpage"
  get "/postcreate" ,to: "post#create"
  get "/commentcreate" ,to: "comments#create"
  get "/addfriend" , to: "friendships#create"


  resources :comments
  resources :post
  resources :users
  resources :friendships
  resources :likepost
  resources :likecomments



  root to: "public#homepage"
end
