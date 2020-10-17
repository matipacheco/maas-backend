# frozen_string_literal: true

class Week < ApplicationRecord
  validates_presence_of :name, :start_date, :end_date

  scope :available, -> { where('start_date <= ?', Date.today.beginning_of_week + 5.weeks) }

  def as_json(*)
    super.tap do |hash|
      hash['start_date'] = start_date.base_format
      hash['end_date'] = end_date.base_format
    end
  end
end
