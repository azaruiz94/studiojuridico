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

ActiveRecord::Schema.define(version: 20180209143959) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "fases", force: :cascade do |t|
    t.string   "nombre"
    t.string   "estado"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "tipo_proceso_id"
    t.index ["tipo_proceso_id"], name: "index_fases_on_tipo_proceso_id", using: :btree
  end

  create_table "funciones", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "proceso_detalles", force: :cascade do |t|
    t.string   "etapa"
    t.string   "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "proceso_id"
    t.string   "fecha"
    t.index ["proceso_id"], name: "index_proceso_detalles_on_proceso_id", using: :btree
  end

  create_table "procesos", force: :cascade do |t|
    t.integer  "doc_numero"
    t.string   "referencia"
    t.string   "estado"
    t.string   "descripcion"
    t.date     "fecha_ingreso"
    t.date     "fecha_salida"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "empleado_id"
    t.integer  "cliente_id"
    t.integer  "tipo_proceso_id"
    t.index ["cliente_id"], name: "index_procesos_on_cliente_id", using: :btree
    t.index ["empleado_id"], name: "index_procesos_on_empleado_id", using: :btree
    t.index ["tipo_proceso_id"], name: "index_procesos_on_tipo_proceso_id", using: :btree
  end

  create_table "tipo_clientes", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_procesos", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "empleado_id"
    t.index ["empleado_id"], name: "index_usuarios_on_empleado_id", using: :btree
  end

  add_foreign_key "ciudades", "departamentos"
  add_foreign_key "clientes", "tipo_clientes"
  add_foreign_key "empleados", "ciudades"
  add_foreign_key "empleados", "funciones"
  add_foreign_key "fases", "tipo_procesos"
  add_foreign_key "proceso_detalles", "procesos"
  add_foreign_key "procesos", "clientes"
  add_foreign_key "procesos", "empleados"
  add_foreign_key "procesos", "tipo_procesos"
  add_foreign_key "usuarios", "empleados"
end
