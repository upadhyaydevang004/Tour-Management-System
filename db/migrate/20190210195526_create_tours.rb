class CreateTours < ActiveRecord::Migration[5.2]
  def change
    create_table :tours do |t|
      t.string :name
      t.text :description
      t.float :price
      t.date :booking_deadline
      t.date :start_date
      t.date :end_date
      t.string :start_location
      t.text :itinerary
      t.string :contact_agent
      t.integer :seats
      t.string :status
      t.string :image
#sdfd
      t.timestamps
    end
  end
end
