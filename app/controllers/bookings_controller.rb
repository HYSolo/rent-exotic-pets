class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @pet = Pet.new(params[:id])
  end

  def create
    @booking = Booking.new(booking_param)
  end

  private

  def booking_param
    params.require(:booking).permit(:start_time, :end_date, :total_price, :pet_id)
  end
end
