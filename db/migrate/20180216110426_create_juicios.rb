class CreateJuicios < ActiveRecord::Migration[5.0]
  def change
    create_table :juicios do |t|
      t.integer :exp_numero
      t.string :caratula
      t.string :fiscal
      t.string :proceso
      t.string :tipo_proceso

      t.timestamps
    end
  end
end
