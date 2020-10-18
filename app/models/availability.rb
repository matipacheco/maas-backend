# frozen_string_literal: true

class Availability < ApplicationRecord
  belongs_to :week
  belongs_to :employee

  validates_presence_of :week
  validates_presence_of :employee

  validates_presence_of :day
  validates_presence_of :hour
end
