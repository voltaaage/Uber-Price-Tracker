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
    @price_estimates = @uber_route.price_estimates.sort_by{|estimate| estimate.created_at}
  end

  def destroy
    @uber_route = UberRoute.find_by(id: params[:id])
    @uber_route.destroy if @uber_route.user == current_user
    redirect_to uber_routes_path
  end
end
