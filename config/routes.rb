Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  resources :users
  resources :leads
  resources :phases
  resources :projects

  # root to: 'lead#loggedIn'
  get '/get_managers', to: 'users#get_managers'
  get '/get_engineers', to: 'users#get_engineers'
  get '/get_engineer_users/:id', to: 'phases#get_engineer_users'
  get '/user_role/:id', to: 'users#user_role'
  post '/assign_engineer', to: 'phases#assign_engineer'
end
