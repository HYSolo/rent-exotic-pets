class Pet < ApplicationRecord
  belongs_to :user
  validates :name, :description, :species, :danger_meter, :price, :location, presence: true
  validates :danger_meter, inclusion: { in: 0..5 }
end
