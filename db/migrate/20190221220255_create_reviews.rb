class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :subject
      t.text :reviews
      t.references :tour
      t.references :customer

      t.timestamps
    end
  end
end
