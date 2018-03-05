class AddCircunscripcionToJuicios < ActiveRecord::Migration[5.0]
  def change
    add_column :juicios, :circunscripcion, :string
  end
end
