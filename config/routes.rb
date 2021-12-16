Rails.application.routes.draw do
  namespace :v1, default: {format:'json'} do

  resources :users, only: [:index,:create] do
    collection do
    post :login 
    get :logout 
    end
  end

  resources :enterprises, only: [:show, :index, :create, :update]

end

end
