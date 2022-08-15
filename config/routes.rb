Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :flow_entries
  get "detail",to: "flow_entries#detail"
  get "timezone",to: "pages#select_timezone"
  get "region",to: "pages#select_region"
  root "pages#home"
end
