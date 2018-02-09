class AddTipoClienteToClientes < ActiveRecord::Migration[5.0]
  def change
    add_reference :clientes, :tipo_cliente, foreign_key: true
  end
end
