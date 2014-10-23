Rails.application.routes.draw do
  
  resources :projects, except: [:new, :edit]
  devise_for :users
  root 'home#index'

end
