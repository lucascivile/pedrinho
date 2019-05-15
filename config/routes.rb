Rails.application.routes.draw do
  resources :users
  get 'welcome/index'

  resources :groups
  
  root 'welcome#index'
end
