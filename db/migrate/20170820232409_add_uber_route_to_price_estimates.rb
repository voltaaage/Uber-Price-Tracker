class AddUberRouteToPriceEstimates < ActiveRecord::Migration[5.1]
  def change
    add_reference :price_estimates, :uber_route, foreign_key: true
  end
end
