class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  # 
  # Associations
  # 
  belongs_to :role, optional: true
  has_many :reservations, dependent: :destroy

  #
  # Scopes
  #
  scope :admins, -> { where(role: Role.find_by(name: Role::ADMIN_ROLE)) }
  scope :customers, -> { where(role: [Role.find_by(name: Role::CUSTOMER_ROLE), nil]) }

  # 
  # methods
  # 
  def admin?
    role&.name == Role::ADMIN_ROLE
  end
end
