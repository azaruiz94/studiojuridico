class Institucion < ApplicationRecord
	validates :nombre, :telefonoA, :ciudad_id, presence: {message: "campo obligatorio"}
end
