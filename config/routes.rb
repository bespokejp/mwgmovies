Rails.application.routes.draw do
  get 'inquiries/index'
  get 'inquiries/confirm'
  get 'inquiries/complete'
  get 'room_payment/create'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
  root to: 'static_pages#welcome'
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
  get 'forgot_password' => 'password_resets#forgot_password', :as => :forgot_password
  get 'mypage' => 'users#mypage', as: :mypage

  get 'inquiries', to: 'inquiries#index'
  post 'inquiries/confirm', to: 'inquiries#confirm'
  post 'inquiries/complete', to: 'inquiries#complete'

  resources :user_sessions
  resources :password_resets
  resources :users do
    member do
      get :activate
      get :change_password
    end
  end
  resources :rooms, shallow: true do
    member do
      get :contents
      resources :payments, only: [:create]
    end
    resources :videos do
      member do
        get :upload
      end
    end
  end
end
