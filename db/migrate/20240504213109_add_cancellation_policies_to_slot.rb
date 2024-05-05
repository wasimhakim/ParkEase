class AddCancellationPoliciesToSlot < ActiveRecord::Migration[7.0]
  def change
    add_column :slots, :cancellation_time_frame_hours, :integer
    add_column :slots, :cancellation_fee_percentage, :decimal, precision: 5, scale: 2
  end
end
