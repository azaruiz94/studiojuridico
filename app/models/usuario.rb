class Usuario < ApplicationRecord
  belongs_to :rol
  belongs_to :empleado

  validates_uniqueness_of :empleado_id
  validates_uniqueness_of :email
  validates_presence_of :password, :password_confirmation, :empleado_id, on: :create,  message: "campo obligatorio"
  validates_length_of :password, minimum: 6, allow_blank: true, message: "muy corta (mínimo 6 caractéres)"
  validates_confirmation_of :password,  message: "las contraseñas no coinciden"

  validates :rol_id, :presence => {message: "campo obligatorio"}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  # Busca que tipo de rol tiene el actual usuario y dependiendo del rol muestra las vista o lo que puede hacer el usuario logueado

  def name_role?(role)
    if self.rol.nombre == role 
      return true     
    else
      return false
    end
  end

  #Este metodo debería de confirmarme que puede hacer el usuario
  def can_do?(role)
    self.rol.acciones.find_by(nombre: role) 
  end
end
