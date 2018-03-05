class AddClienteToJuicios < ActiveRecord::Migration[5.0]
  def change
    add_reference :juicios, :cliente, foreign_key: true
  end
end
