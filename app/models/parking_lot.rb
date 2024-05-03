class ParkingLot < ApplicationRecord

  # 
  # Associations
  # 
  has_many :slots

  # 
  # Validations
  #
  validates :name, presence: true, uniqueness: true
  validates :total_slots, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :start_hour, :end_hour, presence: true
  validate :end_hour_after_start_hour
  

  private

  def end_hour_after_start_hour
    return unless start_hour && end_hour

    errors.add(:end_hour, "must be after start hour") if end_hour <= start_hour
  end
end
