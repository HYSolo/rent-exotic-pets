class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
  end

  def show
  end

  def create
    @pet = Pet.new(pets_param)
    @pet.user = current_user
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pets_param
    params.require(:pet).permit(:name, :description, :species, :danger_meter, :price, :location)
  end
end
