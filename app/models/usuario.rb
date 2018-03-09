class Usuario < ApplicationRecord
  belongs_to :rol
  belongs_to :empleado

  validates_uniqueness_of :empleado_id
  validates_uniqueness_of :email
  validates_presence_of :password, :password_confirmation, :empleado_id, :nombre, on: :create,  message: "campo obligatorio"
  validates_length_of :password, minimum: 6, allow_blank: true, message: "muy corta (mínimo 6 caractéres)"
  validates_confirmation_of :password,  message: "las contraseñas no coinciden"
  validates_uniqueness_of :nombre, :case_sensitive => true, message: "el nombre de usuario ya existe en la base de datos"
  validates :rol_id, :presence => {message: "campo obligatorio"}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:nombre]

  # Busca que tipo de rol tiene el actual usuario y dependiendo del rol muestra las vista o lo que puede hacer el usuario logueado
  def nombre_virtual
    return nil
  end

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
