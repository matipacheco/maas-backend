# frozen_string_literal: true

class Availability < ApplicationRecord
  belongs_to :monitoring_shift
  belongs_to :employee

  validates_presence_of :employee
  validates_presence_of :monitoring_shift

  validates_presence_of :day
  validates_presence_of :hour
end
