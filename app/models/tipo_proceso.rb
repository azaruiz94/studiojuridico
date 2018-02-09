class TipoProceso < ApplicationRecord
	has_many :fases
	accepts_nested_attributes_for :fases, :allow_destroy => true
	validates_presence_of :nombre

end
