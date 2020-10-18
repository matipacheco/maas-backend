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

  def build_monitoring_schedule(date = week.start_date)
    schema = service.monitoring_schema.structure
    schema.transform_keys { |day_index| format_date(date + day_index.days, :week) }
  end

  def get_availabilities
    schema = service.monitoring_schema.structure
    week.get_availabilities(schema)
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
      hash['schedule'] = build_monitoring_schedule
    end
  end
end
