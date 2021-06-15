class PlacesController < ApplicationController
    before_action :ensure_place, only: [:edit, :update, :destroy]
  
  
  def index
   @places = Place.all
   @place = Place.new
  end
  
  def create
    @place = Place.new(place_params)
    @place.save
    redirect_to places_path
  end
  
  
  def edit
    @places = Place.all
  end
  
  def update
    @place.update(place_params)
    redirect_to places_path
  end
  
  def destroy
    @place.destroy
    redirect_to places_path
  end
  
  private

  def place_params
    params.require(:place).permit(:area)
  end
  
  def ensure_place
    @place = Place.find(params[:id])
  end
end
