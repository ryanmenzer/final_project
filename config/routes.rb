UnusUniRails3::Application.routes.draw do

  devise_for :users, :controllers => { :registrations => "milia/registrations" }

  match 'locales/:locale', :to => 'locale#show'
  # map.locales 'locales/:locale', :controller => 'locales', :action => 'show'

  



  # We can now include links in views for switching languages as below:
  # link_to "Norsk", locales_path('no')

  # NOTE: i18n routes must be setup with the following scoping option to display locale info
  # at beginning of path string:
  # scope "(:locale)", locale: /en|nn/ do
  #   resources :books
  # end

  get 'index' => "homes#index"
end
