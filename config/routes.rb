Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root 'posts#index'
  resources :posts do
    get :download, on: :member
    delete :purge, on: :collection
  end

  resources :users, only: [:show, :index, :destroy]

end
