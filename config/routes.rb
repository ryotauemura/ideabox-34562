Rails.application.routes.draw do
  devise_for :users
  get 'ideas/index'
  root to: "ideas#index"
  resources :ideas do
    resources :comments, only: :create
  end
  
end
