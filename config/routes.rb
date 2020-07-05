Rails.application.routes.draw do 
  post '/providers/create.json', to: 'providers#create'  
        
  resources :virtual_charts
  resources :providers
  resources :patients
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
post 'api/v1/providers/upload', to: 'providers#upload'  
  namespace :api do 
    namespace :v1 do  
      get '/providers/upload', to: 'providers#upload' 
      post '/providers/create', to: 'providers#create'
     resources :providers, only: [:index, :create, :destroy, :update]
    end 
  end 

end
