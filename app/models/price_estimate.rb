class PriceEstimate < ApplicationRecord
  belongs_to :uber_route

  def formatted_date_time
    time_requested.in_time_zone('Pacific Time (US & Canada)').strftime('%a %b %d, %H:%M') if time_requested
  end
end
