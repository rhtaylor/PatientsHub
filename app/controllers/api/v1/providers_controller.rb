class Api::V1::ProvidersController < ApplicationController  
    before_action :set_provider, only: [:show, :login, :update, :destroy] 
    

  def current_provider  
    #sets the session cookie 
    session[:provider_id] ||= []
  end 
  def logged_in? 
    current_provider != nil
  end 

  def signout  
    
      session.delete :provider_id  
      render json: {id: params[:id]}
    
  end

  def login_user  
        
        params[:provider] = params
        password = params[:provider][:password]
        email = params[:provider][:email] 
        
        @provider = Provider.find_by(email: email)
         
        
        if      @provider.try(:authenticate, password)   
                #adds the logged in user to the session logged in array
                current_provider << @provider.id 
         
            # session[:id] = @provider.id
            # session[:provider_id] = @provider.id
            @switch = true
        else
            @switch = false 
            # @customer.nil? ? session[:errors] = "Email not found." : session[:errors] = 'Password incorrect.' 
            #session[:page] = 'login'
        end  
   
         if @switch 
             redirect_to api_v1_provider_path(@provider)  
            #  api_v1_providers_path(@provider) returns all providers
           
         else  
          
          render json: @provider.nil? ? "becaome a user" : {error: "Bad Password"} 
         end
    end 
  

  # GET /providers
  def index 
    
    @providers = Provider.all

    render json: @providers
  end
  def upload 
    
  end
  # GET /providers/1
  def show 
    
    render json: @provider
  end

  
  # POST /providers
  def create  
    

    params[:provider] = params 
    
     @provider = Provider.new(provider_params)
    sleep 2
    if @provider.save
      render json: @provider, status: :created, location: @provider
    else
      render json: @provider.errors.full_messages, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /providers/1
  def update
    if @provider.update(provider_params)
      render json: @provider
    else
      render json: @provider.errors, status: :unprocessable_entity
    end
  end

  # DELETE /providers/1
  def destroy
    @provider.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider
      @provider = Provider.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def provider_params 
      
      params.require(:provider).permit(:name, :job, :email, :password, :password_confirmation, :avatar)
    end
end
