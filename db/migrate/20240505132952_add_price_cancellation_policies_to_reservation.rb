class AddPriceCancellationPoliciesToReservation < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :price, :decimal, precision: 10, scale: 2
    add_column :reservations, :cancellation_time_frame_hours, :integer
    add_column :reservations, :cancellation_fee_percentage, :decimal, precision: 5, scale: 2
  end
end
