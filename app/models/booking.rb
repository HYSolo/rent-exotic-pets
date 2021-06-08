class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  validates :start_date, :end_date, :total_price, presence: true
end
