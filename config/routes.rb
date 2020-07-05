Rails.application.routes.draw do 
  post '/providers/create.json', to: 'providers#create'  
        
  resources :virtual_charts
  resources :providers
  resources :patients
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
namespace :api do 
    namespace :v1 do 
     resources :providers, only: [:index, :create, :destroy, :update]
    end 
  end 

end
