Rails.application.routes.draw do

   devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }, controllers: {sessions: "users/sessions"}

   root 'tests#index'

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :processed_tests, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
    end
    resources :gists
    resources :badges
  end

   resources :feed_back, only: %i[index create]

   resources :badges,  only: :index

   resources :given_badges,  only: :index



end
