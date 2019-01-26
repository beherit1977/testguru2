Rails.application.routes.draw do
  root 'tests#index'
  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true
    end

    member do
      post :start
    end
  end

  # GET test_passages/9/result
  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
