class DestinationsController < ApplicationController
  def index
  end

  def new
    @destination = Destination.new
  end

  def create
    @destination = current_user.destinations.create(destination_params)

    redirect_to @destination
  end

  def show
    @destination = Destination.find_by(id: params[:id])
  end

  private

  def destination_params
    params.require(:destination).permit(:address, :city, :state)
  end
end
