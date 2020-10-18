# frozen_string_literal: true

class MonitoringShift < ApplicationRecord
  belongs_to :week
  belongs_to :service

  validates_presence_of :week
  validates_presence_of :service

  serialize :structure

  def build_monitoring_schedule(date = week.start_date)
    schema = service.monitoring_schema.structure
    schema.transform_keys { |day_index| (date + day_index.days).week_day_format }
  end

  def get_availabilities
    schema = service.monitoring_schema.structure
    week.get_availabilities(schema)
  end

  def as_json(*)
    super.tap do |hash|
      hash['schedule'] = build_monitoring_schedule
    end
  end
end
