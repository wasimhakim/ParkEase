class ParkingWorkingHour < ApplicationRecord

  # 
  # Validations
  #
  validates :start_hour, presence: true
  validates :end_hour, presence: true
  validate :end_time_after_start_time

  private

  def end_time_after_start_time
    return if start_hour.blank? || end_hour.blank?

    errors.add(:end_hour, "must be after the start time") if end_hour <= start_hour
  end
end
