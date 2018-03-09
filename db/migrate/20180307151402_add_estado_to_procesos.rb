class AddEstadoToProcesos < ActiveRecord::Migration[5.0]
  def change
    add_reference :procesos, :estado, foreign_key: true
  end
end
