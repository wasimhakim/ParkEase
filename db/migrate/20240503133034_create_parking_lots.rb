class CreateParkingLots < ActiveRecord::Migration[7.0]
  def change
    create_table :parking_lots do |t|
      t.string :name
      t.string :address
      t.time :start_hour
      t.time :end_hour
      t.integer :total_slots

      t.timestamps
    end
  end
end
