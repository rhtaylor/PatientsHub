class Api::V1::ProvidersController < ApplicationController 
    before_action :require_login
    skip_before_action :require_login, only: [:login, :new, :login_user, :create]
   
  before_action :set_provider, only: [:show, :update, :destroy]
  
  def login_user 
    binding.pry 
        password = params[:customer][:password]
        email = params[:customer][:email] 
        
        @provider = Provider.find_by(email: email)
         
        
        if      @provider.try(:authenticate, password)  
            
            # session[:id] = @provider.id
            # session[:provider_id] = @provider.id
            @switch = true
        else
            @switch = false 
            # @customer.nil? ? session[:errors] = "Email not found." : session[:errors] = 'Password incorrect.' 
            session[:page] = 'login'
        end  
   
        render json: @switch ? @customer : @customer.nil? ? "becaome a user" : "Error"
    end 
  end

  # GET /providers
  def index 
    
    @providers = Provider.all

    render json: @providers
  end
  def upload 
    binding.pry
  end
  # GET /providers/1
  def show
    render json: @provider
  end

  # POST /providers
  def create 
    params[:provider] = params
      
    binding.pry  
    ### to attach file from disc
      desc "Import file"
      task :import_file => :environment do
      path = Rails.root.join("tmp", params[:provider][:avatar])

      post = Post.first
      File.open(path) do |io|
      post.image.attach(io: io, filename: "sample.jpg")
      end
      end 
      ### put in helper method 
    @provider = Provider.new(provider_params)
    binding.pry
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
      binding.pry
      params.require(:provider).permit(:name, :job, :email, :password, :password_confirmation, :avatar)
    end
end
