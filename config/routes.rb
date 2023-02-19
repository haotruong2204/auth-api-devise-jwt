Rails.application.routes.draw do
  devise_for :administrators, controllers: { 
    sessions: "administrators/sessions",
    registrations: "administrators/registrations"
  }
end
