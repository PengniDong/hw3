class EntriesController < ApplicationController
  def new
    @place = Place.find(params.fetch("place_id"))
  end

  def create
    input_place_id  = params.fetch("query_place_id")
    input_title     = params.fetch("query_title")
    input_desc      = params.fetch("query_description")
    input_date      = params.fetch("query_posted_on")

    new_entry = Entry.new
    new_entry.place_id   = input_place_id
    new_entry.title      = input_title
    new_entry.description= input_desc
    new_entry.posted_on  = input_date
    new_entry.save

    redirect_to("/places/#{input_place_id}")
  end
end