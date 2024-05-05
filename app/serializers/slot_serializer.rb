class SlotSerializer
  include JSONAPI::Serializer
  attributes :id, :number, :features, :status, :price, :cancellation_fee_percentage, :cancellation_time_frame_hours

  attribute :start_hour do |object|
    object.start_hour.strftime("%H:%M")
  end

  attribute :end_hour do |object|
    object.end_hour.strftime("%H:%M")
  end
end
