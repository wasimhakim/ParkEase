class ParkingWorkingHoursController < ApplicationController
  before_action :set_parking_working_hour, only: %i[ show update destroy ]

  # GET /parking_working_hours
  def index
    @parking_working_hour = ParkingWorkingHour.last

    render json: ParkingWorkingHourSerializer.new(@parking_working_hour).serializable_hash[:data][:attributes] 
  end

  # GET /parking_working_hours/1
  def show
    render json: @parking_working_hour
  end

  # POST /parking_working_hours
  def create
    @parking_working_hour = ParkingWorkingHour.new(parking_working_hour_params)

    if @parking_working_hour.save
      render json: @parking_working_hour, status: :created, location: @parking_working_hour
    else
      render json: @parking_working_hour.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /parking_working_hours/1
  def update
    if @parking_working_hour.update(parking_working_hour_params)
      render json: @parking_working_hour
    else
      render json: @parking_working_hour.errors, status: :unprocessable_entity
    end
  end

  # DELETE /parking_working_hours/1
  def destroy
    @parking_working_hour.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parking_working_hour
      @parking_working_hour = ParkingWorkingHour.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def parking_working_hour_params
      params.require(:parking_working_hour).permit(:start_hour, :end_hour)
    end
end
