class CreateFases < ActiveRecord::Migration[5.0]
  def change
    create_table :fases do |t|
      t.string :nombre
      t.string :estado

      t.timestamps
    end
  end
end
