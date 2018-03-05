class Actuacion < ApplicationRecord
	validates :fecha, :descripcion, :presence => { message: "campo obligatorio" }
end
