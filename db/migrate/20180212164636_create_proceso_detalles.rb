class CreateProcesoDetalles < ActiveRecord::Migration[5.0]
  def change
    create_table :proceso_detalles do |t|
      t.integer :numero
      t.string :lugar
      t.date :fecha_entrada
      t.date :fecha_salida

      t.timestamps
    end
  end
end
