class SlotsController < ApplicationController
  before_action :set_slot, only: %i[ show update destroy ]

  # GET /slots
  def index
    @slots = Slot.all.order(:number)

    render json: SlotSerializer.new(@slots).serializable_hash[:data].map{ |slot| slot[:attributes] }
  end

  # GET /slots/1
  def show
    render json: SlotSerializer.new(@slot).serializable_hash[:data][:attributes]
  end

  # POST /slots
  def create
    @slot = Slot.new(slot_params)

    if @slot.save
      render json: { status: :created, data: SlotSerializer.new(@slot).serializable_hash[:data][:attributes] }
    else
      render json: @slot.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /slots/1
  def update
    if @slot.update(slot_params)
      render json: @slot
    else
      render json: @slot.errors, status: :unprocessable_entity
    end
  end

  # DELETE /slots/1
  def destroy
    @slot.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slot
      @slot = Slot.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def slot_params
      params.require(:slot).permit(
        :number, :status, :price, :start_hour, :end_hour, 
        :cancellation_fee_percentage, :cancellation_time_frame_hours, features: {}
      )
    end
end
