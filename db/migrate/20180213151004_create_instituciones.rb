class CreateInstituciones < ActiveRecord::Migration[5.0]
  def change
    create_table :instituciones do |t|
      t.string :nombre
      t.string :direccion
      t.integer :telefonoA
      t.integer :telefonoB
      t.string :email
      t.string :ruc
      t.string :autoridad

      t.timestamps
    end
  end
end
