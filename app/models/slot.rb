class Slot < ApplicationRecord

  # 
  # Associations
  #
  belongs_to :parking_lot

  #
  # Validations
  #
  validates :number, presence: true, uniqueness: { scope: :parking_lot_id }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :status, presence: true, inclusion: { in: %w[available occupied] }
  validate :check_available_slots, on: :create

  private

  def check_available_slots
    if parking_lot && parking_lot.total_slots <= parking_lot.slots.count
      errors.add(:base, 'No available slots in the parking lot')
    end
  end
end
