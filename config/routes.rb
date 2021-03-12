Rails.application.routes.draw do
  devise_for :users
  get 'ideas/index'
  root to: "ideas#index"
  resources :ideas do
    resources :comments, only: :create
  end
  
  post   '/like/:idea_id' => 'likes#like',   as: 'like'
  delete '/like/:idea_id' => 'likes#unlike', as: 'unlike'

end
