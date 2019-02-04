Rails.application.routes.draw do

  root to: 'tests#index'
  
  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout } 
  
  
  # delete :logout,  to: 'sessions#destroy'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true
    end

    member do
      post :start
    end
  end
  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
