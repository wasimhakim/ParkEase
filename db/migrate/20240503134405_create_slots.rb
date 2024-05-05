class CreateSlots < ActiveRecord::Migration[7.0]
  def change
    create_table :slots do |t|
      t.integer :number
      t.string :status
      t.jsonb :features
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
