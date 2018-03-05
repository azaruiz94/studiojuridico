class Departamento < ApplicationRecord
	validates :nombre, presence: {message: "campo obligatorio"}
end
