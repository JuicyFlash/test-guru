Rails.application.routes.draw do


  get 'sessions/new'
  root 'tests#index'

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  post :logout, to: 'sessions#destroy'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
    resources :questions, shallow: true do
      resources :answers, shallow: true
    end
    member do
      post :start
    end
  end

  resources :processed_tests, only: %i[show update] do
    member do
      get :result
    end
  end

end
