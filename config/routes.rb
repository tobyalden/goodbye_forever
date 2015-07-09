Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root 'posts#index'
  resources :posts do
    get :download, on: :member
  end

  resources :users, only: :show

end
