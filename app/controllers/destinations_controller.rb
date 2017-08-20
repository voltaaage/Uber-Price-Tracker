class DestinationsController < ApplicationController
  def index
  end

  def new
    @destination = Destination.new
  end

  def create
    @destination = current_user.destinations.build(destination_params)
    @destination.save

    new_routes_for_new_destination(@destination)

    redirect_to @destination
  end

  def show
    @destination = Destination.find_by(id: params[:id])
  end

  private

  def destination_params
    params.require(:destination).permit(:address, :city, :state)
  end

  private

  def new_routes_for_new_destination(new_destination)
    existing_destinations = current_user.destinations
    existing_destinations.each do |existing_destination|
      UberRoute.create({
        destination_1_lat: existing_destination.latitude,
        destination_1_long: existing_destination.longitude,
        destination_2_lat: new_destination.latitude,
        destination_2_long: new_destination.longitude
      })
    end
  end
end
