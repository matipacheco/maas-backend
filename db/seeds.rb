# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Service.create(name: 'Recorrido.cl')
Service.create(name: 'Brutal')

MonitoringSchema.create(
  service: Service.first,
  structure: {
    0 => (19..23),
    1 => (19..23),
    2 => (19..23),
    3 => (19..23),
    4 => (19..23),
    5 => (0..23),
    6 => (0..23)
  }
)

Employee.create(name: 'Mati', availability: 15)
Employee.create(name: 'Benjamín', availability: 16)
Employee.create(name: 'Lennart', availability: 19)

week = 7.days
end_day = Date.today.end_of_week
start_day = Date.today.beginning_of_week

(1..5).each do |number|
  Week.create(
    name: "Semana #{number}",
    end_date: end_day + number * week,
    start_date: start_day + number * week
  )
end

MonitoringShift.create(service: Service.first, week: Week.first)
