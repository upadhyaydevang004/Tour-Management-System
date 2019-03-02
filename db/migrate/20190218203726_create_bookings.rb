class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :seats_booked
      t.references :tour
      t.references :customer
      t.timestamps
    end
  end
end
