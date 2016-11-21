class CreateLocalizaciones < ActiveRecord::Migration[5.0]
  def change
    create_table :localizaciones do |t|
      t.string :Descripcion
      t.decimal :Lat
      t.decimal :Lon
    end
  end
end
