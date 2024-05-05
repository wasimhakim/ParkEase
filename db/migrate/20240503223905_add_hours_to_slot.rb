class AddHoursToSlot < ActiveRecord::Migration[7.0]
  def change
    add_column :slots, :start_hour, :time
    add_column :slots, :end_hour, :time
  end
end
