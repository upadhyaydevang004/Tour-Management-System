class Booking < ApplicationRecord
  belongs_to :customer
  belongs_to :tour

  validates :seats_booked, :numericality => { greater_than: 0}
end
