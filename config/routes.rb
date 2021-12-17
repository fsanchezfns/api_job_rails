Rails.application.routes.draw do
  namespace :v1, default: { format: 'json' } do
    resources :users, only: [:create] do
      collection do
        post :login
        get :logout
      end
    end

    resources :enterprises, only: [:index, :create, :update] 
    resources :candidates, only: [:index, :create, :update]
    resources :jobs, only: [:show, :index, :create, :update]
    resources :subscriptions, only: [:show, :index, :create]
  end
end
