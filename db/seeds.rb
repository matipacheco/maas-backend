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

structure = {
  0 => {
    19 =>1,
    20 =>1,
    21 =>1,
    22 =>1,
    23 =>1
  },
  1 => {
    19 =>nil,
    20 =>nil,
    21 =>nil,
    22 =>nil,
    23 =>nil
  },
  2 => {
    19 =>2,
    20 =>2,
    21 =>2,
    22 =>2,
    23 =>2
  },
  3 => {
    19 =>1,
    20 =>1,
    21 =>1,
    22 =>1,
    23 =>1
  },
  4 => {
    19 =>2,
    20 =>2,
    21 =>2,
    22 =>2,
    23 =>2
  },
  5 => {
    1 => 1,
    2 => 1,
    3 => 1,
    4 => 1,
    5 => 1,
    6 => 1,
    7 => 1,
    8 => 1,
    9 => 1,
    10 => 1,
    11 => 1,
    12 => 1,
    13 => 1,
    14 => 1,
    15 => 1,
    16 => 1,
    17 => 1,
    18 => 1,
    19 => 1,
    20 => 1,
    21 => 1,
    22 => 1,
    23 => 1
  },
  6 => {
    1 => 1,
    2 => 1,
    3 => 1,
    4 => 1,
    5 => 1,
    6 => 1,
    7 => 1,
    8 => 1,
    9 => 1,
    10 => 1,
    11 => 1,
    12 => 1,
    13 => 1,
    14 => 1,
    15 => 1,
    16 => 1,
    17 => 1,
    18 => 1,
    19 => 1,
    20 => 1,
    21 => 1,
    22 => 1,
    23 => 1
  }
}

first_shift = MonitoringShift.create(service: recorrido, week: week, structure: structure)
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
