class Actividad < ApplicationRecord
	validates :nombre, :fin, :presence => {message: "campo obligatorio"}
	filterrific(available_filters: [:with_nombre, :sorted_by_inicio])
	scope :with_nombre, -> titulo {Actividad.where("nombre ILIKE ?", "%#{titulo}%")}
	scope :sorted_by_inicio,-> fecha {Actividad.where("fin = ?", "%#{fecha}%"+" 23:59:00")}
end
