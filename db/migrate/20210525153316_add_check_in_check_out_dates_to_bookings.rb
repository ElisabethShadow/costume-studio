class AddCheckInCheckOutDatesToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :check_in, :date
    add_column :bookings, :check_out, :date
  end
end
