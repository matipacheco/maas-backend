# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_201_018_180_953) do
  create_table 'availabilities', force: :cascade do |t|
    t.integer 'monitoring_shift_id', null: false
    t.integer 'employee_id', null: false
    t.integer 'day'
    t.integer 'hour'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['employee_id'], name: 'index_availabilities_on_employee_id'
    t.index ['monitoring_shift_id'], name: 'index_availabilities_on_monitoring_shift_id'
  end

  create_table 'employees', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'monitoring_schemas', force: :cascade do |t|
    t.integer 'service_id', null: false
    t.json 'structure'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['service_id'], name: 'index_monitoring_schemas_on_service_id'
  end

  create_table 'monitoring_shifts', force: :cascade do |t|
    t.integer 'service_id'
    t.integer 'week_id'
    t.json 'structure'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['service_id'], name: 'index_monitoring_shifts_on_service_id'
    t.index ['week_id'], name: 'index_monitoring_shifts_on_week_id'
  end

  create_table 'services', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'weeks', force: :cascade do |t|
    t.string 'name'
    t.date 'start_date'
    t.date 'end_date'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'availabilities', 'employees'
  add_foreign_key 'availabilities', 'monitoring_shifts'
  add_foreign_key 'monitoring_schemas', 'services'
end
