class ParkingWorkingHourSerializer
  include JSONAPI::Serializer

  attribute :start_hour do |object|
    object.start_hour.strftime("%H:%M")
  end

  attribute :end_hour do |object|
    object.end_hour.strftime("%H:%M")
  end

  attribute :range do |object|
    start_time = Time.parse(object.start_hour.strftime("%H:%M"))
    end_time = Time.parse(object.end_hour.strftime("%H:%M"))

    (start_time.to_i..end_time.to_i).step(3600).map { |t| Time.at(t).strftime('%H:%M') }
  end
end
