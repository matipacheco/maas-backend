# frozen_string_literal: true

class Week < ApplicationRecord
  validates_presence_of :name, :start_date, :end_date

  scope :available, -> { where('start_date <= ?', Date.today.beginning_of_week + 5.weeks) }
end
