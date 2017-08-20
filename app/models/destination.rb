class Destination < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :uber_routes

  after_save :new_routes_for_new_destination

  geocoded_by :full_street_address
  after_validation :geocode

  def full_street_address
    "#{address}, #{city}, #{state}"
  end

  def new_routes_for_new_destination
    existing_destinations = user.destinations
    existing_destinations.each do |existing_destination|
      puts user.uber_routes.count
      if id != existing_destination.id
        route = user.uber_routes.create(
          destination_1_lat: existing_destination.latitude,
          destination_1_long: existing_destination.longitude,
          destination_2_lat: latitude,
          destination_2_long: longitude
        )
        route.destinations << self
        route.destinations << existing_destination
      end
      puts user.uber_routes.count
    end
  end
end
