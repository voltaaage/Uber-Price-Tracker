class CreatePriceEstimates < ActiveRecord::Migration[5.1]
  def change
    create_table :price_estimates do |t|
      t.datetime :time_requested
      t.float :high_estimate
      t.float :low_estimate
      t.float :distance
      t.float :surge_multiplier

      t.timestamps
    end
  end
end
