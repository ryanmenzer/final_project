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
    get 'paypal_checkout', to: 'transactions#paypal_checkout'
    post '/transactions/paypal', to: 'transactions#paypal_create'
    # post '/paypal/confirm/:id', to: 'paypal_payment#confirm_payment'
    # resources :paypal_payments
    post '/paypal_payments/:id/confirm' => 'paypal_payments#confirm_payment'
    resources :transactions
    resources :sponsorships
    resources :settings
    resources :receivers
    resources :projects
    resources :paypal_settings
    resources :mandrill_settings
    get '/users/:id' => 'users#show'
    put '/users/:id' => 'users#update'
  end

  match 'locales/:locale', :to => 'locale#show'
  # get '/people/addgroup/:id', :to => 'people#addgroup'
  put '/group/addperson', :to => 'groups#addperson'
  get '/people/addgroup/:id', :to => 'groups#addgroup'
  post '/people/remove/:personid/group/:groupid', :to => 'groups#removeperson'

  # map.locales 'locales/:locale', :controller => 'locales', :action => 'show'
  # We can now include links in views for switching languages as below:
  # link_to "Norsk", locales_path('no')
  # NOTE: i18n routes must be setup with the following scoping option to display locale info
  # at beginning of path string:
  # scope "(:locale)", locale: /en|nn/ do
  #   resources :books
  # end
end
