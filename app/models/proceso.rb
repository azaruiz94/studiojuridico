class Proceso < ApplicationRecord
	belongs_to :cliente
	belongs_to :empleado
	belongs_to :institucion
	belongs_to :estado
	has_many :proceso_detalles
	has_many :respuestas
	accepts_nested_attributes_for :proceso_detalles, :allow_destroy => true

	validates :cliente_id, :empleado_id, :institucion_id, :fecha_ingreso, :doc_numero, :referencia, :presence => { message: "campo obligatorio" }

	filterrific(available_filters: [:with_cliente, :with_institucion, :with_empleado, :sorted_by_doc_numero, :sorted_by_estado])
	scope :with_cliente, -> nombre { joins(:cliente).where('clientes.nombre ILIKE ?', "%#{nombre}%")}
	scope :with_institucion,-> nombre { joins(:instituciones).where('instituciones.nombre ILIKE ?', "%#{nombre}%")}
	scope :with_empleado, -> nombre { joins(:empleado).where('empleados.nombre ILIKE ?', "%#{nombre}%")}
	scope :sorted_by_doc_numero, lambda{ |numero|where(:doc_numero => [*numero])}
	#scope :sorted_by_doc_numero, -> doc_numero { Proceso.where('procesos.doc_numero LIKE ?', Integer(doc_numero))}
	scope :sorted_by_estado, lambda{ |estados|where(:estado_id => [*estados])}

	def self.options_for_sorted_by_doc_numero
    	order('(doc_numero)').map { |e| [e.doc_numero] }.uniq
  	end

end