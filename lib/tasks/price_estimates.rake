namespace :price_estimates do
  desc "Removes old route price estimates"
  task clean_up: :environment do
    PriceEstimate.where('created_at < ?', 20.days.ago).delete_all
  end
end
