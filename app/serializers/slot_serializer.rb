class SlotSerializer
  include JSONAPI::Serializer
  attributes :id, :number, :features, :price, :cancellation_fee_percentage, :cancellation_time_frame_hours

  attribute :start_hour do |object|
    object.start_hour.strftime("%H:%M")
  end

  attribute :end_hour do |object|
    object.end_hour.strftime("%H:%M")
  end

  attribute :status do |object, params|
    if object.status == 'unavailable'
      'unavailable'
    else
      reservations = object.reservations.for_date_and_hour(params[:date], params[:hour])
      if reservations.empty?
        'available'
      else
        'occupied'
      end
    end
  end
  
  def state
  end
end
