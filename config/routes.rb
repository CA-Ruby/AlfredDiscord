Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :flow_entries
  # Defines the root path route ("/")
  root "pages#home"
end
