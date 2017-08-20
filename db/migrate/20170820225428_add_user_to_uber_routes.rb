class AddUserToUberRoutes < ActiveRecord::Migration[5.1]
  def change
    add_reference :uber_routes, :user, foreign_key: true
  end
end
