class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  validates :start_date, :end_date, :total_price, presence: true
  validate :end_date_cannot_be_before_start_date

  def end_date_cannot_be_before_start_date
    if start_date.present? && end_date <= start_date
      errors.add(:end_date, "can't be before start date")
    end
  end

end
