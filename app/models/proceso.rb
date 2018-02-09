class Proceso < ApplicationRecord
	belongs_to :cliente
	belongs_to :tipo_proceso
	belongs_to :empleado
	has_many :proceso_detalles
	accepts_nested_attributes_for :proceso_detalles, :allow_destroy => true
end
