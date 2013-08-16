require 'api_constraints'

Rails4Api::Application.routes.draw do

  scope module: :v1, constraints: ApiConstraints.new(version: 1, default: :true) do
    devise_for :users, path: '/api/users',controllers: {
      registrations: 'api/v1/custom_devise/registrations'
    }
  end

  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: :true) do
      resources :users, :only => [:index]
    end
  end

  #root :to => "home#index"
end
