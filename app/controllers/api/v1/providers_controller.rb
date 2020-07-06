class Api::V1::ProvidersController < ApplicationController
  before_action :set_provider, only: [:show, :update, :destroy]
  
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
      params.require(:provider).permit(:name, :job, :email, :password, :password_confirmation)
    end
end
