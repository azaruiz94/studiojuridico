class Juicio < ApplicationRecord
	belongs_to :cliente
	belongs_to :empleado
	belongs_to :objeto
	has_many :actuaciones
	accepts_nested_attributes_for :actuaciones, :allow_destroy => true
	validates :cliente_id, :empleado_id, :circunscripcion, :tipo_proceso, :proceso, :objeto_id, :presence => { message: "campo obligatorio" }
end
