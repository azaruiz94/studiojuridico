# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Departamento.create(nombre: "Itapua")

Ciudad.create(nombre: "Encarnacion", departamento_id: "1")

Cliente.create(nombre: "Maria Jose", direccion: "Avda Costanera", telefono: "12322342")

Empleado.create(nombre: "Juan Ortega", direccion: "Calle Artigas", telefono: "098653234")


