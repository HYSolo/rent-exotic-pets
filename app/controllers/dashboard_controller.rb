class DashboardController < ApplicationController
  def index
    @pets = current_user.pets
    @booked_pets = current_user.pets.select { |pet| pet.bookings.exists? }
  end
end
