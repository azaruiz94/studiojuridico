class AddTipoProcesoToFases < ActiveRecord::Migration[5.0]
  def change
    add_reference :fases, :tipo_proceso, foreign_key: true
  end
end
