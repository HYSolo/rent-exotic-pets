class Pet < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, :description, :species, :danger_meter, :price, :address, presence: true
  validates :danger_meter, inclusion: { in: 0..5 }
  has_many_attached :photos
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
