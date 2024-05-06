class Slot < ApplicationRecord
  # 
  # Constants
  # 
  AVAILABLE = 'available'
  UNAVAILABLE = 'unavailable'
  OCCUPIED = 'occupied'

  #
  # Validations
  #
  validates :number, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :status, presence: true, inclusion: { in: [AVAILABLE, UNAVAILABLE] }
  validates :start_hour, :end_hour, presence: true
  validate :end_time_after_start_time

  # 
  # Associations
  # 
  has_many :reservations

  #
  # Scopes
  #
  scope :available, -> { where(status: AVAILABLE) }
  scope :in_start_end_hours, ->(hour) {
    where("start_hour <= ? AND end_hour > ?", hour, hour)
  }
  scope :by_features, ->(features) {
    conditions = []

    features.each do |key, value|
      if value.present?
        conditions << "features @> jsonb_build_object(?, ?)"
      end
    end

    where(conditions.join(" AND "), *features.reject { |_k, v| v.blank? }.flatten) if conditions.any?
  }

  private

  def end_time_after_start_time
    return if start_hour.blank? || end_hour.blank?

    errors.add(:end_hour, "must be after the start time") if end_hour <= start_hour
  end
end
