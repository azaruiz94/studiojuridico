class AddInstitucionToProcesos < ActiveRecord::Migration[5.0]
  def change
    add_reference :procesos, :institucion, foreign_key: true
  end
end
