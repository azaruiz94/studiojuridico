class CreateProcesoDetalles < ActiveRecord::Migration[5.0]
  def change
    create_table :proceso_detalles do |t|
      t.string :etapa
      t.string :estado

      t.timestamps
    end
  end
end
