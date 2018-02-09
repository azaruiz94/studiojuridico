class AddFechaToProcesoDetalles < ActiveRecord::Migration[5.0]
  def change
    add_column :proceso_detalles, :fecha, :string
  end
end
