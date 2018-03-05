class AddEmpleadoToJuicios < ActiveRecord::Migration[5.0]
  def change
    add_reference :juicios, :empleado, foreign_key: true
  end
end
