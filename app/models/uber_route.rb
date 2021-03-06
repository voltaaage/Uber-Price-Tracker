class UberRoute < ApplicationRecord
  has_and_belongs_to_many :destinations
  has_many :price_estimates, dependent: :destroy
  belongs_to :user

  def create_price_estimate_from_uberx_price_estimate
    puts uber_route_price_estimate
    if uber_route_price_estimate
      self.price_estimates.create(
        high_estimate: uber_x_price_estimate.high_estimate,
        low_estimate: uber_x_price_estimate.low_estimate,
        distance: uber_x_price_estimate.distance,
        surge_multiplier: uber_x_price_estimate.surge_multiplier,
        time_requested: DateTime.current
      )
    end
  rescue StandardError => e
    puts e.inspect
  end

  def uber_route_price_estimate
    @uber_route_price_estimate ||= client.price_estimations(
      start_latitude: destination_1_lat,
      start_longitude: destination_1_long,
      end_latitude: destination_2_lat,
      end_longitude: destination_2_long
    )
  end

  def uber_x_price_estimate
    @uber_x_price_estimate ||= uber_route_price_estimate.find{|price| price.display_name == 'uberX'}
  end


  def formatted_destinations
    destinations.map(&:full_street_address).join(' TO ')
  end

  private

  def client
    @client ||= Uber::Client.new do |config|
      config.server_token  = ENV['UBER_SERVER_TOKEN']
      config.client_id     = ENV['UBER_CLIENT_ID']
      config.client_secret = ENV['UBER_CLIENT_SECRET']
    end
  end
end
