class CreateDestinations < ActiveRecord::Migration[5.1]
  def change
    create_table :destinations do |t|
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
