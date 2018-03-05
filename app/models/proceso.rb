class Proceso < ApplicationRecord
	belongs_to :cliente
	belongs_to :empleado
	belongs_to :institucion
	has_many :proceso_detalles
	has_many :respuestas
	accepts_nested_attributes_for :proceso_detalles, :allow_destroy => true

	validates :cliente_id, :empleado_id, :institucion_id, :fecha_ingreso, :doc_numero, :referencia, :presence => { message: "campo obligatorio" }
end