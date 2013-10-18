UnusUniRails3::Application.routes.draw do
  devise_for :users


  get 'index' => "homes#index"

end
