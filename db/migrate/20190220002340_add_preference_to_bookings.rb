class AddPreferenceToBookings < ActiveRecord::Migration[5.2]
  def up
    add_column :bookings, :preference, :string
  end
  def down
    remove_column :bookings, :preference, :string
  end
end
