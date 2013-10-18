UnusUniRails3::Application.routes.draw do

  devise_for :users, :controllers => { :registrations => "milia/registrations" }

end
