class VenuesController < ApplicationController
  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(params[:venue])

    if @venue.save
      @venues = Venue.ordered.includes(:concerts)
      render :template => "concerts/create"
    else
      render :json => {fields: @venue.errors.keys, msgs: @venue.errors.full_messages}, :status => 422
    end
  end
end
