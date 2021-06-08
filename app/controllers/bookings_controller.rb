class BookingsController < ApplicationController
  before_action :set_pet, only: %i[new create]

  def new
    @booking = Booking.new
    @pet = Pet.find(params[:pet_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @booking.pet = @pet
    @rental_duration_days = @booking.end_date - @booking.start_date
    @booking.total_price = @booking.pet.price * @rental_duration_days
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def index
    @bookings = current_user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

    private

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price, :pet_id)
  end
end
