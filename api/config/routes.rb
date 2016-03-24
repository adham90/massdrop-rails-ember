Rails.application.routes.draw do
  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth'

    resources :communities, except: [:new, :edit]

    resources :pictures

    resources :products, except: [:new, :edit] do
      resources :drops, on: :member
      resources :pictures
      resources :polls, on: :member
    end
  end
end
