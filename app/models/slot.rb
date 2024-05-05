class Slot < ApplicationRecord

  #
  # Validations
  #
  validates :number, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :status, presence: true, inclusion: { in: %w[available unavailable] }
  validates :start_hour, :end_hour, presence: true
  validate :end_time_after_start_time

  #
  # Scopes
  #
  scope :available, -> { where(status: 'available') }

  private

  def end_time_after_start_time
    return if start_hour.blank? || end_hour.blank?

    errors.add(:end_hour, "must be after the start time") if end_hour <= start_hour
  end
end
