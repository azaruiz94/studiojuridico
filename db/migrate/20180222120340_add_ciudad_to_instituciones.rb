class AddCiudadToInstituciones < ActiveRecord::Migration[5.0]
  def change
    add_reference :instituciones, :ciudad, foreign_key: true
  end
end
