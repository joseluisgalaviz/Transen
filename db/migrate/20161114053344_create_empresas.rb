class CreateEmpresas < ActiveRecord::Migration[5.0]
  def change
    create_table :empresas do |t|
      t.string :Nombre
    end
  end
end
