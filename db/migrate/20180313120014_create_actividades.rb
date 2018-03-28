class CreateActividades < ActiveRecord::Migration[5.0]
  def change
    create_table :actividades do |t|
     t.string :nombre
     t.string :descripcion
      t.datetime :inicio
      t.datetime :fin

      t.timestamps
    end
  end
end
