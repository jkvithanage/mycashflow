Rails.application.routes.draw do
  devise_for :users
  root 'accounts#index'

  resources :categories
  resources :accounts
  resources :transactions do
    collection do
      get :read
      post :import
    end
  end
end
