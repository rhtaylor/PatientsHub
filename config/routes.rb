Rails.application.routes.draw do
  resources :virtual_charts
  resources :providers
  resources :patients
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end