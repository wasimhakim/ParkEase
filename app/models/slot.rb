class Slot < ApplicationRecord

  # 
  # Associations
  #
  belongs_to :parking_lot

  #
  # Validations
  #
  validate :check_available_slots, on: :create

  private

  def check_available_slots
    if parking_lot && parking_lot.total_slots <= parking_lot.slots.count
      errors.add(:base, 'No available slots in the parking lot')
    end
  end
end
