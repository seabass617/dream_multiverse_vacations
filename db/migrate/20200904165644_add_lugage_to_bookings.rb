class AddLugageToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :lugage, :boolean
  end
end
