class AddEmpleadoToProcesos < ActiveRecord::Migration[5.0]
  def change
    add_reference :procesos, :empleado, foreign_key: true
  end
end
