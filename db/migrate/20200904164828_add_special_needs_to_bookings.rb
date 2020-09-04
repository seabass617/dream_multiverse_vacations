class AddSpecialNeedsToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :special_needs, :string
  end
end
