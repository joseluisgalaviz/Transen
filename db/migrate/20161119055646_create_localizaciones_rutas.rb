class CreateLocalizacionesRutas < ActiveRecord::Migration[5.0]
  def change
    create_table :localizaciones_rutas do |t|
      t.integer :ruta_id
      t.integer :localizacion_id
    end
  end

end
