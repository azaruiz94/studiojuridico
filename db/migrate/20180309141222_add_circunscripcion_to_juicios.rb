class AddCircunscripcionToJuicios < ActiveRecord::Migration[5.0]
  def change
    add_reference :juicios, :circunscripcion, foreign_key: true
  end
end
