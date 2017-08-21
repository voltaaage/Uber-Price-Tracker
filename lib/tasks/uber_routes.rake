namespace :uber_routes do
  desc "Queries the Uber API for price estimates of all UberRoutes"
  task collect_price_estimates: :environment do
    UberRoute.all.each { |route| route.create_price_estimate_from_uberx_price_estimate }
  end
end
