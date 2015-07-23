Rails.application.routes.draw do
  resources :points
  root 'static_pages#home'
  get 'about'   => 'static_pages#about'
  get 'signup' => 'users#new'
  get 'login'   => 'sessions#new'
  post 'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users # , only: [:show]
  resources :tracks, only: [:index, :show]
  resources :circuits, only: [:index, :show]
  resources :athletes
  resources :seasons, only: [:index, :show]
  resources :timesheets do
    post 'import', on: :member
    resources :entries, shallow: true do
      collection { post :sort }
      resources :runs, shallow: true, except: :index
    end
    resources :points, only: [:index, :create]
  end

  namespace :admin do
    resources :tracks
    resources :users
    resources :circuits
    resources :points
    resources :runs, only: :index
  end

  get '/become/:id', to: 'admin#become'

  # match '/about', to: 'static_pages#about', via: 'get'
  # match '/signup', to: 'users#new', via: 'get'
  # match '/signin', to: 'sessions#new', via: 'get'
  # match '/signout', to: 'sessions#destroy', via: 'delete'
  # match 'timesheets/:timesheet_id/startlist', to: 'entries#index', via: 'get'
end
