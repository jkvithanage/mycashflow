Rails.application.routes.draw do
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
