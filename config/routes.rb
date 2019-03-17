Rails.application.routes.draw do

  resources :feedbacks
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_id: :login, sign_out: :logout },
             controllers: { sessions: 'users/sessions' }

  resources :tests, only: :index do
    post :start, on: :member
  end
  
  resources :feedbacks, only: %i[new create]

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  resources :personal_user_badges, only: %i[index]

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :gists, only: :index
    resources :badges
  end
end
