Rails.application.routes.draw do

   devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }, controllers: {sessions: "users/sessions"}
   #devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  root 'tests#index'

  # get :signup, to: 'users#new'
  # get :login, to: 'sessions#new'
  # delete :logout, to: 'sessions#destroy'

  #resources :users, only: :create
  #resources :sessions, only: :create

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :processed_tests, only: %i[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
    end
  end

end
