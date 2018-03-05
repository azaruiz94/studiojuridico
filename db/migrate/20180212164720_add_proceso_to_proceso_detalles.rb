class AddProcesoToProcesoDetalles < ActiveRecord::Migration[5.0]
  def change
    add_reference :proceso_detalles, :proceso, foreign_key: true
  end
end
