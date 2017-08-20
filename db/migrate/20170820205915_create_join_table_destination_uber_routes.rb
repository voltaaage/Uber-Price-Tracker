class CreateJoinTableDestinationUberRoutes < ActiveRecord::Migration[5.1]
  def change
    create_join_table :destinations, :uber_routes do |t|
      # t.index [:destination_id, :uber_route_id]
      # t.index [:uber_route_id, :destination_id]
    end
  end
end
