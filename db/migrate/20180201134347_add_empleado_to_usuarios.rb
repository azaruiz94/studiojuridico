class AddEmpleadoToUsuarios < ActiveRecord::Migration[5.0]
  def change
    add_reference :usuarios, :empleado, foreign_key: true
  end
end
