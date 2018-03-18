class Juicio < ApplicationRecord
	belongs_to :cliente
	belongs_to :empleado
	belongs_to :objeto
	belongs_to :circunscripcion
	belongs_to :estado
	has_many :actuaciones

	accepts_nested_attributes_for :actuaciones, :allow_destroy => true
	validates :cliente_id, :empleado_id, :estado_id, :circunscripcion_id, :tipo_proceso, :proceso, :objeto_id, :presence => { message: "campo obligatorio" }

	filterrific(available_filters: [:with_cliente, :with_empleado, :with_exp_numero, :sorted_by_estado, 
		:sorted_by_cicunscripcion, :with_caratula, :sorted_by_proceso])
	scope :with_cliente, -> nombre { joins(:cliente).where('clientes.nombre ILIKE ?', "%#{nombre}%")}
	scope :with_empleado, -> nombre { joins(:empleado).where('empleados.nombre ILIKE ?', "%#{nombre}%")}
	scope :with_exp_numero, lambda{ |numero|where(:exp_numero => [*numero])}
	scope :sorted_by_estado, lambda{ |estados|where(:estado_id => [*estados])}
	scope :sorted_by_cicunscripcion, -> nombre { joins(:circunscripcion).where('circunscripciones.nombre ILIKE ?', "%#{nombre}%")}
	scope :with_caratula, -> caratula { Juicio.where('caratula ILIKE ?', "%#{caratula}%")}
	scope :sorted_by_proceso,  -> proceso { Juicio.where('proceso ILIKE ?', "%#{proceso}%")}
end