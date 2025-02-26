class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params.fetch("id"))
    @entries = @place.entries.order(:posted_on)
  end

  def new
  end

  def create
    input_name = params.fetch("place_name")

    place = Place.new
    place.name = input_name
    place.save

    redirect_to("/places")
  end
end