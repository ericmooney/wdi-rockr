WdiRockr::Application.routes.draw do

  get "auth/twitter/callback" => 'sessions#create'

  resources :venues, :only => [:new, :create]
  resources :concerts, :only => [:new, :create]

  root :to => 'static_pages#index'
end
