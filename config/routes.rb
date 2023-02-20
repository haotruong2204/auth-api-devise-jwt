Rails.application.routes.draw do
  devise_for :administrators, controllers: { 
    sessions: "administrators/sessions",
    registrations: "administrators/registrations"
  }

  namespace :api do
    namespace :v1 do
      resources :companies
    end
  end
end
