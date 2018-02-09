class AddCiudadToEmpleados < ActiveRecord::Migration[5.0]
  def change
    add_reference :empleados, :ciudad, foreign_key: true
  end
end
