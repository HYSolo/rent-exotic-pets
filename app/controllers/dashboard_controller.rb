class DashboardController < ApplicationController
  def index
    @pets = current_user.pets.select { |pet| pet.bookings.exists? }
    @bookings = @pets.map { |pet| pet.bookings }
    # byebug
  end
end
