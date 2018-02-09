class CreateClientes < ActiveRecord::Migration[5.0]
  def change
    create_table :clientes do |t|
      t.string :nombre
      t.string :direccion
      t.integer :telefono
      t.string :email
      t.string :ruc

      t.timestamps
    end
  end
end
