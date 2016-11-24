class CreateInterestPoints < ActiveRecord::Migration[5.0]
  def change
    create_table :interest_points do |t|
      t.string :description
      t.decimal :lat
      t.decimal :lon
    end
  end
end
