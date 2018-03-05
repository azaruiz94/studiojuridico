class Objeto < ApplicationRecord
	validates :proceso, :tipo_proceso, :nombre, :presence => { message: "campo obligatorio" }
end
