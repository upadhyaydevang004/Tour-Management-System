class AddCountryStateToTours < ActiveRecord::Migration[5.2]
  def up
    add_column :tours, :country, :string
    add_column :tours, :state, :string
  end
  def down
    remove_column :tours, :country, :string
    remove_column :tours, :state, :string
  end
end
