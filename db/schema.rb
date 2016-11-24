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

ActiveRecord::Schema.define(version: 20161124081947) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companys", force: :cascade do |t|
    t.string "name"
  end

  create_table "empresas", force: :cascade do |t|
    t.string "Nombre"
  end

  create_table "interest_points", force: :cascade do |t|
    t.string  "description"
    t.decimal "lat"
    t.decimal "lon"
  end

  create_table "localizaciones", force: :cascade do |t|
    t.decimal "Lat"
    t.decimal "Lon"
  end

  create_table "localizaciones_rutas", force: :cascade do |t|
    t.integer "ruta_id"
    t.integer "localizacion_id"
  end

  create_table "locations", force: :cascade do |t|
    t.decimal "lat"
    t.decimal "lon"
  end

  create_table "puntos_interes", force: :cascade do |t|
    t.string  "descripcion"
    t.decimal "lat"
    t.decimal "lon"
  end

  create_table "route_locations", force: :cascade do |t|
    t.integer "route_id"
    t.integer "location_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string  "name"
    t.integer "company_id"
  end

  create_table "rutas", force: :cascade do |t|
    t.integer "Empresa"
    t.string  "Nombre"
  end

end
