# frozen_string_literal: true

class Week < ApplicationRecord
  has_many :availabilities

  validates_presence_of :name, :start_date, :end_date

  scope :valid_week_range, -> { where('start_date <= ?', Date.today.beginning_of_week + 5.weeks) }

  def get_availabilities(schema)
    schedule = {}

    schema.each do |day_index, hours|
      available_slots = {}

      hours.each do |hour|
        available_slots[hour] = availabilities.where(day: day_index, hour: hour).pluck(:employee_id)
      end

      schedule[(start_date + day_index.days).week_day_format] = available_slots
    end

    schedule
  end

  def as_json(*)
    super.tap do |hash|
      hash['start_date'] = start_date.base_format
      hash['end_date'] = end_date.base_format
    end
  end
end
