class AddStatusToBookings < ActiveRecord::Migration[5.2]
  def up
    add_column :bookings, :status, :integer
  end
  def down
    remove_column :bookings, :status, :integer
  end
end
