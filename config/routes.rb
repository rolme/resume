Resume::Application.routes.draw do

  get "home/index"

  devise_for :authentication, :controllers => {
    :sessions => "users/sessions",
    :registrations => "users/registrations"
  }

  devise_scope :authentication do
    get "signin", :to => "users/sessions#new"
    get "signout", :to => "users/sessions#destroy"
    get "signup", :to => "users/registrations#new"
  end

  root :to => "home#index"

end
