class UberRoutesController < ApplicationController
  def index
    if current_user
      @uber_routes = current_user.uber_routes
    else
      @uber_routes = []
    end
  end

  def show
    @uber_route = UberRoute.find(params[:id])
    @price_estimates = @uber_route.price_estimates
  end
end
