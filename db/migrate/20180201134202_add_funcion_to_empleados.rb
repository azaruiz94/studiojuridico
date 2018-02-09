class AddFuncionToEmpleados < ActiveRecord::Migration[5.0]
  def change
    add_reference :empleados, :funcion, foreign_key: true
  end
end
