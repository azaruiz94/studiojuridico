class Ciudad < ApplicationRecord
	belongs_to :departamento
	validates :departamento_id, :nombre, presence: {message: "campo obligatorio"}
	validates_uniqueness_of :nombre, message: "la ciudad ya existe", :case_sensitive => true, rescue_from_duplicate: true
end
