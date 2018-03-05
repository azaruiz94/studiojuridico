class Empleado < ApplicationRecord
	validates :nombre, :email, :ruc, :presence => {:message => "campo obligatorio" }	
end
