class CreateProcesos < ActiveRecord::Migration[5.0]
  def change
    create_table :procesos do |t|
      t.integer :doc_numero
      t.string :referencia
      t.string :estado
      t.string :descripcion
      t.date :fecha_ingreso
      t.date :fecha_salida

      t.timestamps
    end
  end
end
