class CreateActuaciones < ActiveRecord::Migration[5.0]
  def change
    create_table :actuaciones do |t|
      t.integer :numero
      t.date :fecha
      t.string :descripcion
      t.string :tipo

      t.timestamps
    end
  end
end
