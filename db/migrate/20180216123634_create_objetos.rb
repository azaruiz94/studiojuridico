class CreateObjetos < ActiveRecord::Migration[5.0]
  def change
    create_table :objetos do |t|
      t.string :proceso
      t.string :tipo_proceso
      t.string :nombre

      t.timestamps
    end
  end
end
