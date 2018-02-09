class AddTipoProcesoToProcesos < ActiveRecord::Migration[5.0]
  def change
    add_reference :procesos, :tipo_proceso, foreign_key: true
  end
end
