Resume::Application.routes.draw do

  get "home/index"

  devise_for :user

  devise_scope :user do
    get "signin", :to => "devise/sessions#new"
    get "signout", :to => "devise/sessions#destroy"
    get "signup", :to => "devise/registrations#new"
  end

  root :to => "home#index"

end
