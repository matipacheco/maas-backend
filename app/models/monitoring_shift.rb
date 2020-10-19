# frozen_string_literal: true

class MonitoringShift < ApplicationRecord
  include DateHandler

  belongs_to :week
  belongs_to :service

  has_many :availabilities

  validates_presence_of :week
  validates_presence_of :service

  serialize :structure

  after_save :generate_schedule

  def get_availabilities
    schema = service.monitoring_schema.structure
    schedule = {}

    schema.each do |day_index, hours|
      available_slots = {}

      hours.each do |hour|
        available_slots[hour] = availabilities.where(day: day_index, hour: hour).pluck(:employee_id)
      end

      schedule[format_date(week.start_date + day_index.days, :week)] = available_slots
    end

    schedule
  end

  def update_availability(params)
    availability = availabilities.where(params)

    if availability.any?
      availability.map(&:destroy)
    else
      availability = availabilities.build(params)
      availability.save
    end
  end

  def generate_schedule
    # TODO: develop algorithm!
  end

  def as_json(*)
    super.tap do |hash|
      hash['structure'] = structure.transform_keys { |day_index| format_date(week.start_date + day_index.days, :week) } rescue nil
    end
  end
end
