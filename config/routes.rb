Rails.application.routes.draw do
  get 'signup', to: 'autors#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :autors, only: %i[new create] do
    get :profile, on: :collection
    patch :save_profile, on: :collection
  end
  post 'vote', to: 'votes#vote'

  resources :autors
  resources :sessions
  get 'sessions/new'
  resources :posts do
    resources :comments do
      member do
        post :publish
      end
    end
  end

  root 'posts#index'
end
