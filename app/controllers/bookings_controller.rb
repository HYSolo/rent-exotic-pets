class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_param)
  end

  private

  def booking_param
    params.require(:booking).permit(:start_time, :end_date, :total_price)
  end
end
