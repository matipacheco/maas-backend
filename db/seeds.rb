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
    1 => (0...12).to_a
  }
)

week = 7.days
end_day = Date.today.end_of_week
start_day = Date.today.beginning_of_week

(0..5).each do |number|
  Week.create(
    name: "Semana #{number + 1}",
    end_date: end_day + number * week,
    start_date: start_day + number * week
  )
end

week = Week.first

first_shift = MonitoringShift.create(service: recorrido, week: week)
MonitoringShift.create(service: brutal, week: week)

Employee.create(name: 'Mati')
Employee.create(name: 'Benjamín')
Employee.create(name: 'Lennart')

(0...7).each do |day|
  (0...24).each do |hour|
    availabilities = Array.new(rand(0..3)) { rand(1..3) }.uniq
    availabilities.each do |number|
      Availability.create(
        monitoring_shift: first_shift,
        employee_id: number,
        day: day,
        hour: hour
      )
    end
  end
end

first_shift.generate_schedule
