class CreateCiudades < ActiveRecord::Migration[5.0]
  def change
    create_table :ciudades do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
