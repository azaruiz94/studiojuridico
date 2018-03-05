# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180301113417) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acciones", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "acciones_roles", id: false, force: :cascade do |t|
    t.integer "accion_id"
    t.integer "rol_id"
    t.index ["accion_id", "rol_id"], name: "index_acciones_roles_on_accion_id_and_rol_id", using: :btree
    t.index ["accion_id"], name: "index_acciones_roles_on_accion_id", using: :btree
    t.index ["rol_id"], name: "index_acciones_roles_on_rol_id", using: :btree
  end

  create_table "actuaciones", force: :cascade do |t|
    t.integer  "numero"
    t.date     "fecha"
    t.string   "descripcion"
    t.string   "tipo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "juicio_id"
    t.index ["juicio_id"], name: "index_actuaciones_on_juicio_id", using: :btree
  end

  create_table "ciudades", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "departamento_id"
    t.index ["departamento_id"], name: "index_ciudades_on_departamento_id", using: :btree
  end

  create_table "clientes", force: :cascade do |t|
    t.string   "nombre"
    t.string   "direccion"
    t.integer  "telefono"
    t.string   "email"
    t.string   "ruc"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "tipo_cliente_id"
    t.index ["tipo_cliente_id"], name: "index_clientes_on_tipo_cliente_id", using: :btree
  end

  create_table "departamentos", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "empleados", force: :cascade do |t|
    t.string   "nombre"
    t.string   "direccion"
    t.integer  "telefono"
    t.string   "email"
    t.string   "ruc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "funcion_id"
    t.integer  "ciudad_id"
    t.index ["ciudad_id"], name: "index_empleados_on_ciudad_id", using: :btree
    t.index ["funcion_id"], name: "index_empleados_on_funcion_id", using: :btree
  end

  create_table "funciones", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instituciones", force: :cascade do |t|
    t.string   "nombre"
    t.string   "direccion"
    t.integer  "telefonoA"
    t.integer  "telefonoB"
    t.string   "email"
    t.string   "ruc"
    t.string   "autoridad"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "departamento_id"
    t.integer  "ciudad_id"
    t.index ["ciudad_id"], name: "index_instituciones_on_ciudad_id", using: :btree
    t.index ["departamento_id"], name: "index_instituciones_on_departamento_id", using: :btree
  end

  create_table "juicios", force: :cascade do |t|
    t.integer  "exp_numero"
    t.string   "caratula"
    t.string   "fiscal"
    t.string   "proceso"
    t.string   "tipo_proceso"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "cliente_id"
    t.integer  "empleado_id"
    t.integer  "objeto_id"
    t.string   "circunscripcion"
    t.index ["cliente_id"], name: "index_juicios_on_cliente_id", using: :btree
    t.index ["empleado_id"], name: "index_juicios_on_empleado_id", using: :btree
    t.index ["objeto_id"], name: "index_juicios_on_objeto_id", using: :btree
  end

  create_table "objetos", force: :cascade do |t|
    t.string   "proceso"
    t.string   "tipo_proceso"
    t.string   "nombre"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "proceso_detalles", force: :cascade do |t|
    t.integer  "numero"
    t.string   "lugar"
    t.date     "fecha_entrada"
    t.date     "fecha_salida"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "proceso_id"
    t.index ["proceso_id"], name: "index_proceso_detalles_on_proceso_id", using: :btree
  end

  create_table "procesos", force: :cascade do |t|
    t.integer  "doc_numero"
    t.string   "referencia"
    t.string   "estado"
    t.string   "descripcion"
    t.date     "fecha_ingreso"
    t.date     "fecha_salida"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "empleado_id"
    t.integer  "cliente_id"
    t.integer  "institucion_id"
    t.index ["cliente_id"], name: "index_procesos_on_cliente_id", using: :btree
    t.index ["empleado_id"], name: "index_procesos_on_empleado_id", using: :btree
    t.index ["institucion_id"], name: "index_procesos_on_institucion_id", using: :btree
  end

  create_table "respuestas", force: :cascade do |t|
    t.string   "memo"
    t.date     "fecha"
    t.string   "medios"
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "proceso_id"
    t.index ["proceso_id"], name: "index_respuestas_on_proceso_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "nombre"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["nombre", "resource_type", "resource_id"], name: "index_roles_on_nombre_and_resource_type_and_resource_id", using: :btree
    t.index ["nombre"], name: "index_roles_on_nombre", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id", using: :btree
  end

  create_table "tipo_clientes", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "empleado_id"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "rol_id"
    t.index ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
    t.index ["empleado_id"], name: "index_usuarios_on_empleado_id", using: :btree
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree
    t.index ["rol_id"], name: "index_usuarios_on_rol_id", using: :btree
  end

  add_foreign_key "actuaciones", "juicios"
  add_foreign_key "ciudades", "departamentos"
  add_foreign_key "clientes", "tipo_clientes"
  add_foreign_key "empleados", "ciudades"
  add_foreign_key "empleados", "funciones"
  add_foreign_key "instituciones", "ciudades"
  add_foreign_key "instituciones", "departamentos"
  add_foreign_key "juicios", "clientes"
  add_foreign_key "juicios", "empleados"
  add_foreign_key "juicios", "objetos"
  add_foreign_key "proceso_detalles", "procesos"
  add_foreign_key "procesos", "clientes"
  add_foreign_key "procesos", "empleados"
  add_foreign_key "procesos", "instituciones"
  add_foreign_key "respuestas", "procesos"
  add_foreign_key "usuarios", "empleados"
  add_foreign_key "usuarios", "roles"
end
