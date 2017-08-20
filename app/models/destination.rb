class Destination < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :uber_routes

  geocoded_by :full_street_address
  after_validation :geocode

  def full_street_address
    "#{address}, #{city}, #{state}"
  end
end
