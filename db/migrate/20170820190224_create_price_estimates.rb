class CreatePriceEstimates < ActiveRecord::Migration[5.1]
  def change
    create_table :price_estimates do |t|
      t.datetime :time_requested
      t.float :high_estimate
      t.float :low_estimate
      t.float :distance
      t.float :surge_multiplier
      t.references :uber_routes, foreign_key: true

      t.timestamps
    end
  end
end
