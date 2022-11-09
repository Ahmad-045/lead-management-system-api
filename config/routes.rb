Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  get '/get_managers', to: 'users#get_managers'
  resources :users
  resources :leads
  resources :phases
end
