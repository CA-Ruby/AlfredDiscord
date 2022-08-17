Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :flow_entries
  resources :users
  get 'detail', to: 'flow_entries#detail'
  get 'region', to: 'pages#select_region'
  root 'pages#home'
end
