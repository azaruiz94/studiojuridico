class Rol < ApplicationRecord
  has_and_belongs_to_many :acciones, :join_table => :acciones_roles
  validates :nombre, presence: {message: "campo obligatorio"}

  belongs_to :resource,
             :polymorphic => true,
             :optional => true
# Comento este codigo porque me genera error al querer guardar
  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true
#

  scopify

  has_many :usuarios
  validates :acciones, presence: {message: "Seleccione una acción."}
end
