class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table(:roles) do |t|
      t.string :nombre
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:acciones_roles, :id => false) do |t|
      t.references :accion
      t.references :rol
    end

    add_index(:roles, :nombre)
    add_index(:roles, [ :nombre, :resource_type, :resource_id ])
    add_index(:acciones_roles, [ :accion_id, :rol_id ])
  end
end
