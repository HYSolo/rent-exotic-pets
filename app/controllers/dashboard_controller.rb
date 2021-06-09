class DashboardController < ApplicationController
  def index
    @pets = current_user.pets
    @bookings = current_user.bookings
  end

  def pets
    @pets = current_user.pets
  end

  def bookings
    @bookings = current_user.bookings
  end
end
