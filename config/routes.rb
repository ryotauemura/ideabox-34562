Rails.application.routes.draw do
  devise_for :users
  get 'ideas/index'
  root to: "ideas#index"
  resources :ideas, only: [:index,:new]
end
