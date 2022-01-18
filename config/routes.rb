Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/dashboard" ,to: "users#index"
  get "/personalpage" ,to: "users#personalpage"
  get "/postcreate" ,to: "post#create"
  get "/commentcreate" ,to: "comments#create"


  resources :comments
  resources :post
  root to: "public#homepage"
end
