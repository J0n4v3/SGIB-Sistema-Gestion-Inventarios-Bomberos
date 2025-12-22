# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_11_27_231648) do
  create_table "ajustes", force: :cascade do |t|
    t.integer "producto_id", null: false
    t.integer "user_id", null: false
    t.integer "cantidad_anterior"
    t.integer "cantidad_nueva"
    t.string "motivo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["producto_id"], name: "index_ajustes_on_producto_id"
    t.index ["user_id"], name: "index_ajustes_on_user_id"
  end

  create_table "mantenimientos", force: :cascade do |t|
    t.integer "producto_id", null: false
    t.integer "user_id", null: false
    t.string "tipo"
    t.text "descripcion"
    t.date "fecha_mantenimiento"
    t.date "proximo_mantenimiento"
    t.string "estado_post_mantenimiento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["producto_id"], name: "index_mantenimientos_on_producto_id"
    t.index ["user_id"], name: "index_mantenimientos_on_user_id"
  end

  create_table "movimientos", force: :cascade do |t|
    t.integer "producto_id", null: false
    t.string "tipo"
    t.integer "cantidad"
    t.string "observacion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["producto_id"], name: "index_movimientos_on_producto_id"
  end

  create_table "productos", force: :cascade do |t|
    t.string "nombre"
    t.string "categoria"
    t.integer "cantidad"
    t.string "unidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "stock_minimo"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "ajustes", "productos"
  add_foreign_key "ajustes", "users"
  add_foreign_key "mantenimientos", "productos"
  add_foreign_key "mantenimientos", "users"
  add_foreign_key "movimientos", "productos"
end
