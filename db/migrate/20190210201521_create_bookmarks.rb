class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      t.references :tour
      t.references :customer

      t.timestamps
    end
  end
end
