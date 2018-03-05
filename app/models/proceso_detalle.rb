class ProcesoDetalle < ApplicationRecord
	validates :lugar, :fecha_entrada, :presence => { message: "campo obligatorio" }
end
