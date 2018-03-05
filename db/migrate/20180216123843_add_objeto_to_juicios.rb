class AddObjetoToJuicios < ActiveRecord::Migration[5.0]
  def change
    add_reference :juicios, :objeto, foreign_key: true
  end
end
