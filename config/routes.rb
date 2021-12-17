Rails.application.routes.draw do
  namespace :v1, default: { format: 'json' } do
    resources :users, only: [:create] do
      collection do
        post :login
        get :logout
      end
    end

    resources :enterprises, only: %i[index create update]
    resources :candidates, only: %i[index create update]
    resources :jobs, only: %i[show index create update] do
      member do
        get :subscriptions
      end
      get 'subscriptions/:id', to: 'jobs#showsubscriptions'
      put 'subscriptions/:id', to: 'jobs#updatesubscriptions'
    end

    resources :subscriptions, only: %i[show index create]
  end
end
