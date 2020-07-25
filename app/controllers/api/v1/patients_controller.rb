class Api::V1::PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :update, :destroy]

  # GET /patients
  def index 
    
    @patients = Patient.all

    render json: @patients
  end
  def my_patients 
    
    render json: Provider.find(params[:provider_id]).patients.uniq
  end
  # GET /patients/1
  def show
    render json: @patient
  end

  # POST /patients
  def create 
    @provider = Provider.find(params[:provider_id]) 
    
    @patient = @provider.patients.build(patient_params)
    

    if @patient.save 
      
      render json: @patient, status: :created, location: @patient
    else
      render json: @patient.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /patients/1
  def update
    if @patient.update(patient_params)
      render json: @patient
    else
      render json: @patient.errors, status: :unprocessable_entity
    end
  end

  # DELETE /patients/1
  def destroy
    @patient.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def patient_params
      params.require(:patient).permit(:name, :email, :phone_number, :diagnosis, :age)
    end
end
