class CreateRespuestas < ActiveRecord::Migration[5.0]
  def change
    create_table :respuestas do |t|
      t.string :memo
      t.date :fecha
      t.string :medios
      t.string :descripcion

      t.timestamps
    end
  end
end
