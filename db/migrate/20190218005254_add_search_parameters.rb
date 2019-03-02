class AddSearchParameters < ActiveRecord::Migration[5.2]
  def up
    add_column :searches, :min_price, :float
    add_column :searches, :max_price, :float
    add_column :searches, :name, :string
    add_column :searches, :start_date_from, :date
    add_column :searches, :start_date_to, :date
  end
  def down
    remove_column :searches, :min_price, :float
    remove_column :searches, :max_price, :float
    remove_column :searches, :name, :string
    remove_column :searches, :start_date_from, :date
    remove_column :searches, :start_date_to, :date
  end

end
