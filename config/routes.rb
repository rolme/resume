Resume::Application.routes.draw do

  get "cv", to: "cvs#show", id: 1

  devise_for :users

  devise_scope :user do
    get "signin",  to: "devise/sessions#new"
    get "signout", to: "devise/sessions#destroy"
    get "signup",  to: "devise/registrations#new"
  end

  resources :users

  resources :skillsets, only: [] do 
    collection do
      post :sort
    end
  end

  resources :skills, only: [] do 
    collection do
      post :sort
    end
  end

  root to: "home#index"

end
