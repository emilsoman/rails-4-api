require 'api_constraints'

Rails4Api::Application.routes.draw do

      devise_for :users, path: '/api/v1/users',controllers: {
        registrations: 'api/v1/custom_devise/registrations'
      }

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :users, :only => [:index]
    end
  end

  #root :to => "home#index"
end
