class PetsController < ApplicationController
  before_action :set_pet, only: %i[show]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:query].present?
      @pets = Pet.global_search(params[:query])
    else
      @pets = Pet.all
    end
    
    # the `geocoded` scope filters only pets with coordinates (latitude & longitude)
    @markers = @pets.geocoded.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude,
        info_window: render_to_string(partial: "info_window", locals: { pet: pet }),
        marker_html: render_to_string(partial: "map_marker", locals: { pet: pet })
      }
    end
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
    params.require(:pet).permit(:name, :description, :species, :danger_meter, :price, :address, photos: [])
  end
end
