class ParkingLotsController < ApplicationController
  before_action :set_parking_lot, only: %i[ show update destroy ]

  # GET /parking_lots
  def index
    @parking_lots = ParkingLot.all

    render json: @parking_lots
  end

  # GET /parking_lots/1
  def show
    render json: @parking_lot
  end

  # POST /parking_lots
  def create
    @parking_lot = ParkingLot.new(parking_lot_params)

    if @parking_lot.save
      render json: @parking_lot, status: :created, location: @parking_lot
    else
      render json: @parking_lot.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /parking_lots/1
  def update
    if @parking_lot.update(parking_lot_params)
      render json: @parking_lot
    else
      render json: @parking_lot.errors, status: :unprocessable_entity
    end
  end

  # DELETE /parking_lots/1
  def destroy
    @parking_lot.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parking_lot
      @parking_lot = ParkingLot.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def parking_lot_params
      params.require(:parking_lot).permit(:name, :address, :start_hour, :end_hour, :total_slots)
    end
end
