Rails.application.routes.draw do
  
  resources :projects, except: [:new, :edit] do
    resources :cards, except: [:new, :edit, :show, :index] do
      collection { post :sort }
    end
  end
  devise_for :users
  root 'home#index'

end
