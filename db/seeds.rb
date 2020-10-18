# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

recorrido = Service.create(name: 'Recorrido.cl')
brutal = Service.create(name: 'Brutal')

MonitoringSchema.create(
  service: recorrido,
  structure: {
    0 => (19...24).to_a,
    1 => (19...24).to_a,
    2 => (19...24).to_a,
    3 => (19...24).to_a,
    4 => (19...24).to_a,
    5 => (0...24).to_a,
    6 => (0...24).to_a
  }
)

MonitoringSchema.create(
  service: brutal,
  structure: {
    0 => (0...12).to_a,
    1 => (0...12).to_a,
  }
)

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

MonitoringShift.create(service: recorrido, week: Week.first)
MonitoringShift.create(service: brutal, week: Week.first)

Employee.create(name: 'Mati')
Employee.create(name: 'Benjamín')
Employee.create(name: 'Lennart')

(0...24).each do |number|
  hour = Hour.create(hour: number)
  availabilities = Array.new(rand(0..3)) { rand(1..3) }.uniq
  availabilities.each { |number| EmployeeAvailability.create(hour: hour, employee_id: number) }
end

