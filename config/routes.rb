Rails.application.routes.draw do
  resources :test_passages
  root to: 'tests#index'

  resources :tests do
    resources :questions, shallow: true
  end
end
