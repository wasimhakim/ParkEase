class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :name

  attribute :role do |object|
    object.role&.name || Role::CUSTOMER_ROLE
  end
end
