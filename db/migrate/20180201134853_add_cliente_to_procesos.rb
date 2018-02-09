class AddClienteToProcesos < ActiveRecord::Migration[5.0]
  def change
    add_reference :procesos, :cliente, foreign_key: true
  end
end
