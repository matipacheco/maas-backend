# frozen_string_literal: true

# Service in charge of the creation of the structure of a monitoring shift.
# This service uses the following algorithms to assign a shift to an employee.

# 1. Shifts are build day by day, starting on Monday and ending on Sunday.
# 2. In each day, it starts by assigning time blocks to the employee that has less time blocks assigned and is available (To give the chance that all employees have a balanced work load).
# 3. Whenever an employee isn't available on a given time block, it selects the employee who has the most consecutive time blocks starting that point (To reduce shift changing).

class ShiftCalculatorService
  def self.calculate(availabilities, schema)
    result = {}
    @@current_employee = nil
    @@availabilities = availabilities
    @@hours_worked = { 1 => 0, 2 => 0, 3 => 0 }

    schema.each do |day_index, hour_range|
      daily_schedule = {}

      hour_range.each do |hour|
        # It assigns the first shift to the first available employee with the lighter workload
        unless @@current_employee
          get_lazy(day_index, hour)
          assign_employee(daily_schedule, hour, @@current_employee)
          next
        end

        # If the employee who was in charge of the previous shift is available in the current shift, maintain him.
        if is_available?(day_index, hour, @@current_employee)
          assign_employee(daily_schedule, hour, @@current_employee)

        # If the employee who was in charge of the previous shift is NOT available in the current shift...
        else
          # Case 1: Employee wasn't available because nobody was available in that time block.
          other_availabilities = get_day_hour_availability(day_index, hour)
          if other_availabilities.empty?
            assign_employee(daily_schedule, hour, nil)
            next
            # At this point we could set @@current_employee to nil, so that in the next iteration
            # it starts again by selecting the employee with the smallest workload, but this will
            # increase the "shift change" among employees. So lets keep the current employee,
            # hoping he is available in the next shift.
          end

          # Case 2: There is availability to take the current shift.
          # Idea: Select the employee who is available in the current shift and in the next one.

          # Case 2.1: If nobody is available in the next shift, just pick anyone to take on the current shift.
          unless tomorrow_availabilities = get_day_hour_availability(day_index, hour + 1)
            assign_employee(daily_schedule, hour, other_availabilities.first)
            next
          end

          # Case 2.2: If there are employees available in the current shift and in the next one.
          shared_availability = other_availabilities.intersection(tomorrow_availabilities)

          # Case 2.2.1: But they are different employees...
          @@current_employee = if shared_availability.empty?
                                 other_availabilities.first

                               # Case 2.2.2: They are the same. Meaning that some of the available employees
                               # in the current shift are also available in the next one
                               else
                                 shared_availability.first

                               end

          assign_employee(daily_schedule, hour, @@current_employee)
        end
      end

      @@current_employee = nil
      result[day_index] = daily_schedule
    end

    result
  end

  def self.get_lazy(day_index, hour)
    @@hours_worked.sort_by(&:last).map(&:first).each do |employee_id|
      return @@current_employee = employee_id if is_available?(day_index, hour, employee_id)
    end
  end

  def self.update_workload(employee_id)
    return unless employee_id

    @@hours_worked[employee_id] = @@hours_worked[employee_id] + 1
  end

  def self.get_day_hour_availability(day_index, hour)
    @@availabilities[day_index][hour]
  end

  def self.is_available?(day_index, hour, employee_id)
    get_day_hour_availability(day_index, hour).include? employee_id
  end

  def self.assign_employee(daily_schedule, hour, employee_id)
    daily_schedule[hour] = employee_id
    update_workload(employee_id)
  end
end
