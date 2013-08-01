WdiRockr::Application.routes.draw do

  get "auth/twitter/callback" => 'sessions#create'

  get 'signout' => 'sessions#destroy', :as => 'signout'

  resources :venues, :only => [:new, :create]
  resources :concerts, :only => [:new, :create]

  root :to => 'static_pages#index'
end
