class Reservation < ApplicationRecord

  # 
  # Associations
  # 
  belongs_to :user
  belongs_to :slot

  # 
  # Validations
  # 
  validates :date, presence: true
  validates :start_hour, presence: true
  validates :end_hour, presence: true
  validates :status, presence: true
  validates :price, presence: true
  validate :end_time_after_start_time

  #
  # scopes
  #
  scope :for_date_and_hour, ->(date, hour) {
    where(date: date, status: ["active", "in"])
    .where("start_hour <= ? AND end_hour > ?", hour, hour)
  }
  default_scope { order(created_at: :desc) }

  # 
  # Callbacks
  #
  before_save :set_status

  private

  def set_status
    self.status = "IN" if self.check_in.present?
    self.status = "OUT" if self.check_out.present?
  end

  def end_time_after_start_time
    return if start_hour.blank? || end_hour.blank?

    errors.add(:end_hour, "must be after the start time") if end_hour <= start_hour
  end
end
