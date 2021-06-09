class Pet < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, :description, :species, :danger_meter, :price, :location, presence: true
  validates :danger_meter, inclusion: { in: 0..5 }
  has_many_attached :photos
end
