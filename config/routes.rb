WdiRockr::Application.routes.draw do
  get "sessions/create"
  get 'signout', to: 'sessions#destroy', as: 'signout'
  # match 'auth/failure', to: redirect('/')

  get 'auth/:provider/callback', to: 'sessions#create'

  resources :venues, :only => [:new, :create]
  resources :concerts, :only => [:new, :create]

  root :to => 'static_pages#index'
end
