class Reservation < ApplicationRecord

  # 
  # Associations
  # 
  belongs_to :user
  belongs_to :slot

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
    self.status = "in" if self.check_in.present?
    self.status = "out" if self.check_out.present?
  end
end
