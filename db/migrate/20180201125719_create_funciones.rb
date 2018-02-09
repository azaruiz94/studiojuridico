class CreateFunciones < ActiveRecord::Migration[5.0]
  def change
    create_table :funciones do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
