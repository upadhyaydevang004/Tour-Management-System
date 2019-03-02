class Tour < ApplicationRecord
  belongs_to :agent
  has_many :bookmarks, dependent: :destroy
  has_many :bookings, dependent: :destroy

  validates :name, :presence => true
  validates :description, :presence => true
  validates :price, :presence => true,:numericality => {:greater_than => 0}
  validates :booking_deadline, :presence => true
  validates :start_date, :presence => true
  validates :end_date, :presence => true
  validates :start_location, :presence => true
  validates :itinerary, :presence => true
  validates :seats, :presence => true , :numericality => {:greater_than_or_equal_to => 0}
  # validates :agent_id, :presence => true
  validates :status, :presence => true
  validates :country, :presence => true
  validates :state, :presence => true
  #adding the class of uploader to the model where it needs to be uploaded/shown
  mount_uploader :image, ImageUploader

end
