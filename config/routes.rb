UnusUniRails3::Application.routes.draw do

  get 'index' => "homes#index"

  devise_for :users, :controllers => { :registrations => "milia/registrations" }
  resources :emails

  get 'newimage' => "images#new"
  post 'newimage' => "images#create"

end
