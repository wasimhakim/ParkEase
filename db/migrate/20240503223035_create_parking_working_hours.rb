class CreateParkingWorkingHours < ActiveRecord::Migration[7.0]
  def change
    create_table :parking_working_hours do |t|
      t.time :start_hour
      t.time :end_hour

      t.timestamps
    end
  end
end
