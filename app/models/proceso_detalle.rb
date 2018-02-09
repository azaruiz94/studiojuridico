class ProcesoDetalle < ApplicationRecord

	def fases
		@fases_rows= Fase.where("tipo_proceso_id = ?", Proceso.last.tipo_proceso_id)
		return fases_rows
	end

	def self.tabla(proceso_detalle)
		@proceso_detalle = proceso_detalle



	end
end
