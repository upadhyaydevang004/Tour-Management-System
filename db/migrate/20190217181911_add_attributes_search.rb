class AddAttributesSearch < ActiveRecord::Migration[5.2]
  def up
   add_column :searches, :itinerary, :string
  end
  def down
    remove_column :searches, :itinerary
  end
end
