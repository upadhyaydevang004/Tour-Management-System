class AddSeatsToSearch < ActiveRecord::Migration[5.2]
  def up
    add_column :searches, :seats, :integer
  end
  def down
    remove_column :searches, :seats, :integer
  end
end
