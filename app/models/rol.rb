class Rol < ApplicationRecord
  has_and_belongs_to_many :acciones, :join_table => :acciones_roles
  validates :nombre, presence: {message: "campo obligatorio"}
  validates_uniqueness_of :nombre, :case_sensitive => true, message: "el nombre del rol ya existe en la base de datos"

  belongs_to :resource,
             :polymorphic => true,
             :optional => true
# Comento este codigo porque me genera error al querer guardar
#  validates :resource_type,
#            :inclusion => { :in => Rolify.resource_types },
#            :allow_nil => true
#

  has_many :usuarios
# Si no se puede cargar el rol desde el seed. Borrar estas dos lineas
# hablitarlas a la hora de probar o al llevar a produccion
  scopify
  validates :acciones, presence: {message: "Seleccione una acción."}  
######################################################################


end
