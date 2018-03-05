class Cliente < ApplicationRecord
	belongs_to :tipo_cliente
	validates :nombre, :email, :tipo_cliente_id, :ruc, :presence => {:message => "campo obligatorio" }
end
