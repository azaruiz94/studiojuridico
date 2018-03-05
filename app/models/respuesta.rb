class Respuesta < ApplicationRecord
	belongs_to :proceso

	validates :memo, :fecha, :descripcion, :presence => { message: "campo obligatorio" }

	def cliente
		return nil
	end

	def correo
		return nil
	end

	def referencia
		return nil
	end
end
