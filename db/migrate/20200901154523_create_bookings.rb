class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :trip_duration
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :dimension, null: false, foreign_key: true

      t.timestamps
    end
  end
end
