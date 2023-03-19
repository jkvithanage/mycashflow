Rails.application.routes.draw do
  get 'dashboard/show'
  devise_for :users

  authenticated :user do
    root to: 'dashboard#show', as: :user_root
  end

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  resources :categories do
    get '/page/:page', action: :index, on: :collection
  end

  resources :accounts
  resources :transactions do
    get '/page/:page', action: :index, on: :collection
    collection do
      get :read
      post :import
    end
  end
end
