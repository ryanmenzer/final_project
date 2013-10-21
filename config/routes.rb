UnusUniRails3::Application.routes.draw do

  devise_for :users, :controllers => { :registrations => "milia/registrations" }

  scope "(:locale)", locale: /en|no|es|tl/ do
    root to: "homes#index"
    resources :emails
    resources :people
    resources :initiatives
    resources :images
    resources :groups
    resources :stories
    resources :transactions
    resources :sponsorships
    resources :settings
    resources :receivers
    resources :projects
    get '/users/:id' => 'users#show'
    put '/users/:id' => 'users#update'
  end

  match 'locales/:locale', :to => 'locale#show'



  # map.locales 'locales/:locale', :controller => 'locales', :action => 'show'
  # We can now include links in views for switching languages as below:
  # link_to "Norsk", locales_path('no')
  # NOTE: i18n routes must be setup with the following scoping option to display locale info
  # at beginning of path string:
  # scope "(:locale)", locale: /en|nn/ do
  #   resources :books
  # end
end
