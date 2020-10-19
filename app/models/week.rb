# frozen_string_literal: true

class Week < ApplicationRecord
  include DateHandler

  validates_presence_of :name, :start_date, :end_date

  scope :valid_week_range, -> { where('start_date <= ?', Date.today.beginning_of_week + 5.weeks) }

  def as_json(*)
    super.tap do |hash|
      hash['start_date'] = format_date(start_date)
      hash['end_date'] = format_date(end_date)
    end
  end
end
