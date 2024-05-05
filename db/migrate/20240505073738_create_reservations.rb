class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :user
      t.references :slot
      t.date :date
      t.time :start_hour
      t.time :end_hour
      t.datetime :check_in
      t.datetime :check_out
      t.string :status

      t.timestamps
    end
  end
end
