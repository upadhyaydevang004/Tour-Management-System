class Bookmark < ApplicationRecord
  belongs_to :customer
  belongs_to :tour

  validates :customer_id, presence: true
  validates :tour_id, presence: true
end
