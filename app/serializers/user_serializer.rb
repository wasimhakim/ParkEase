class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :name

  attribute :role do |object|
    object.role&.name || Role::CUSTOMER_ROLE
  end

  attribute :reservations do |object|
    ReservationSerializer.new(object.reservations).serializable_hash[:data].map{|reservation| reservation[:attributes]}
  end
end
