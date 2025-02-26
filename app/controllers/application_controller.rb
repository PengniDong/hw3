class ApplicationController < ActionController::Base
  def index
    @places = Place.all
    # Renders views/places/index.html.erb by default
  end

  def show
    # Find the specific place, and also gather its entries
    @place = Place.find(params.fetch("id"))
    @entries = @place.entries.order(:posted_on)
    # Renders views/places/show.html.erb
  end

  def new
    # Renders views/places/new.html.erb
  end

  def create
    # Pull data from the form
    input_name = params.fetch("place_name")

    # Insert a new place record into the DB
    place = Place.new
    place.name = input_name
    place.save

    # Redirect to the list of places
    redirect_to("/places")
  end
end