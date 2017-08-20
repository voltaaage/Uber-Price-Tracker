class CreateUberRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :uber_routes do |t|
      t.string :destination_1_lat
      t.string :destination_1_long
      t.string :destination_2_lat
      t.string :destination_2_long

      t.timestamps
    end
  end
end
