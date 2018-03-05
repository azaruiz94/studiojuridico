class AddJuicioToActuaciones < ActiveRecord::Migration[5.0]
  def change
    add_reference :actuaciones, :juicio, foreign_key: true
  end
end
