class VirtualChartsController < ApplicationController
  before_action :set_virtual_chart, only: [:show, :update, :destroy]

  # GET /virtual_charts
  def index
    @virtual_charts = VirtualChart.all

    render json: @virtual_charts
  end

  # GET /virtual_charts/1
  def show
    render json: @virtual_chart
  end

  # POST /virtual_charts
  def create
    @virtual_chart = VirtualChart.new(virtual_chart_params)

    if @virtual_chart.save
      render json: @virtual_chart, status: :created, location: @virtual_chart
    else
      render json: @virtual_chart.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /virtual_charts/1
  def update
    if @virtual_chart.update(virtual_chart_params)
      render json: @virtual_chart
    else
      render json: @virtual_chart.errors, status: :unprocessable_entity
    end
  end

  # DELETE /virtual_charts/1
  def destroy
    @virtual_chart.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_virtual_chart
      @virtual_chart = VirtualChart.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def virtual_chart_params
      params.require(:virtual_chart).permit(:date, :note, :provider_id, :patient_id)
    end
end