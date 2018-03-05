class Ciudad < ApplicationRecord
	belongs_to :departamento
	validates :departamento_id, :nombre, presence: {message: "campo obligatorio"}
end
