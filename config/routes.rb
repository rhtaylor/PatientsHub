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
      get '/virtual_charts_full', to: 'virtual_charts#full_record' 
      post 'providers/login', to: 'providers#login_user' 
      get '/providers/:provider_id/my_patients', to: 'patients#my_patients' 
      post '/providers/:provider_id/:patient_id/virtual_chart', to: 'virtual_charts#create' 
      get '/providers/:provider_id/:patient_id/virtual_chart', to: 'virtual_charts#create'  
      post '/providers/signout', to: 'providers#signout' 
    
     resources :virtual_charts
     resources :providers, only: [:index, :show, :create, :destroy, :update] do
      resources :patients do 
        resources :virtual_charts 
      end
     end
     resources :patients
    end 
  end 

end
 

#  @pro.patients.first.virtual_charts.build(note: "YO", date: Date.today)