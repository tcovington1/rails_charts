Rails.application.routes.draw do
  root 'charts#index'
  devise_for :users

  resources :charts do
    resources :tunes
  end
end
