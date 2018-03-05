# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Rol.create(id: "1", nombre: "admin")
Rol.create(id: "2", nombre: "Gestor Contensioso - Adm")
Rol.create(id: "3", nombre: "Gestor Civil-Laboral")

Cliente.create(nombre: "Maria Jose", direccion: "Avda. Costanera", telefono: "12322342", email: "maria@gmail.com", ruc: "232133-2", tipo_cliente_id: "1")
Cliente.create(nombre: "Juan Perez", direccion: "Gral. Artigas No. 2334", telefono: "7565564", email: "juanperez@gmail.com", ruc: "834784-5", tipo_cliente_id: "2")
Cliente.create(nombre: "Carlos Mateo", direccion: "Avda Caballero", telefono: "3453434", email: "carlosm@gmail.com",ruc: "9486973-3", tipo_cliente_id: "2")

user= Usuario.new
user= Usuario.create(nombre: "Abog. Dario Lopez", email: "dario@gmail.com", empleado_id: "1", rol_id: "1", password: "123456", password_confirmation: "123456")
user= Usuario.create(nombre: "Lic. Marta Torres", email: "marta@gmail.com", empleado_id: "2", rol_id: "2", password: "123456", password_confirmation: "123456")
user= Usuario.create(nombre: "Dr. Ruben Miranda", email: "ruben@gmail.com", empleado_id: "3", rol_id: "3", password: "123456", password_confirmation: "123456")

Departamento.create(nombre: "Itapúa")
Departamento.create(nombre: "Misiones")
Departamento.create(nombre: "Central")

Ciudad.create(nombre: "Encarnación", departamento_id: "1")
Ciudad.create(nombre: "Cambyreta", departamento_id: "1")
Ciudad.create(nombre: "Cnel. Bogado", departamento_id: "1")

TipoCliente.create(nombre: "Fisico")
TipoCliente.create(nombre: "Jurídico")

Objeto.create(nombre: "un objeto civil ejecutivo ", proceso: "Civil", tipo_proceso: "Ejecutivo")
Objeto.create(nombre: "un objeto civil especial", proceso: "Civil", tipo_proceso: "Especial")
Objeto.create(nombre: "un objeto civil ordinario", proceso: "Civil", tipo_proceso: "Ordinario")
Objeto.create(nombre: "un objeto civil sumario", proceso: "Civil", tipo_proceso: "Sumario")

Objeto.create(nombre: "un objeto laboral ejecutivo", proceso: "Laboral", tipo_proceso: "Ejecutivo")
Objeto.create(nombre: "un objeto laboral especial", proceso: "Laboral", tipo_proceso: "Especial")
Objeto.create(nombre: "un objeto laboral ordinario", proceso: "Laboral", tipo_proceso: "Ordinario")
Objeto.create(nombre: "un objeto laboral sumario", proceso: "Laboral", tipo_proceso: "Sumario")



Empleado.create(nombre: "Abog. Dario Lopez", direccion: "Corrientes N° 234", telefono: "833453423", email: "dario@gmail.com", ruc: "343537-4", ciudad_id: "1")
Empleado.create(nombre: "Lic. Marta Torres", direccion: "Constitucion Nacional N° 68", telefono: "445345534", email: "marta@gmail.com", ruc: "363434-4", ciudad_id: "2")
Empleado.create(nombre: "Dr. Ruben Miranda", direccion: "Avda. Irrazabal", telefono: "9375344", email: "ruben@gmail.com", ruc: "698394-4", ciudad_id: "3")

Institucion.create(nombre: "Entidad Binacional Yacyreta", direccion: "Circuito Comercial - Encarnacion", telefonoA: "021222345", email: "eby@gov.com.py", ruc: "32756556-5", departamento_id: "1", autoridad: "Ing. Poncho López")

Accion.create(nombre: "Ver Procesos")
Accion.create(nombre: "Crear Procesos")
Accion.create(nombre: "Editar Procesos")
Accion.create(nombre: "Eliminar Procesos")

Accion.create(nombre: "Ver Juicios")
Accion.create(nombre: "Crear Juicios")
Accion.create(nombre: "Editar Juicios")
Accion.create(nombre: "Eliminar Juicios")

Accion.create(nombre: "Ver Usuarios")
Accion.create(nombre: "Crear Usuarios")
Accion.create(nombre: "Editar Juicios")
Accion.create(nombre: "Eliminar Juicios")

Accion.create(nombre: "Ver Clientes")
Accion.create(nombre: "Crear Clientes")
Accion.create(nombre: "Editar Clientes")
Accion.create(nombre: "Eliminar Clientes")

Accion.create(nombre: "Ver Empleados")
Accion.create(nombre: "Crear Empleados")
Accion.create(nombre: "Editar Empleados")
Accion.create(nombre: "Eliminar Empleados")

Accion.create(nombre: "Ver Instituciones")
Accion.create(nombre: "Crear Instituciones")
Accion.create(nombre: "Editar Instituciones")
Accion.create(nombre: "Eliminar Instituciones")

Accion.create(nombre: "Ver Objetos")
Accion.create(nombre: "Crear Objetos")
Accion.create(nombre: "Editar Objetos")
Accion.create(nombre: "Eliminar Objetos")

Accion.create(nombre: "Ver Ciudades")
Accion.create(nombre: "Crear Ciudades")
Accion.create(nombre: "Editar Ciudades")
Accion.create(nombre: "Eliminar Ciudades")

Accion.create(nombre: "Ver Depatamentos")
Accion.create(nombre: "Crear Depatamentos")
Accion.create(nombre: "Editar Depatamentos")
Accion.create(nombre: "Eliminar Depatamentos")