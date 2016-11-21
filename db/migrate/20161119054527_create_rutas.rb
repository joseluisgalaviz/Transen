class CreateRutas < ActiveRecord::Migration[5.0]
  def change
    create_table :rutas do |t|
      t.integer :Empresa
      t.string :Nombre
    end
  end

end
