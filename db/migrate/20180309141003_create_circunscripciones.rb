class CreateCircunscripciones < ActiveRecord::Migration[5.0]
  def change
    create_table :circunscripciones do |t|
      t.integer :numero
      t.string :nombre

      t.timestamps
    end
  end
end
