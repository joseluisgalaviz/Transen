class CreateRouteLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :route_locations do |t|
      t.integer :route_id
      t.integer :location_id
    end
  end
end
