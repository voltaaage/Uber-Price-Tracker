namespace :uber_routes do
  desc 'Queries the Uber API for price estimates of all UberRoutes'
  task collect_price_estimates: :environment do
    UberRoute.all.each { |route| route.create_price_estimate_from_uberx_price_estimate }
  end

  desc 'Deletes every other price estimate from the last day'
  task delete_every_other: :environment do
    UberRoute.where('created_at < ?', 1.day.ago).each { |a| a.price_estimates.each_slice(2) {|a| a[0].delete}}
  end
end
