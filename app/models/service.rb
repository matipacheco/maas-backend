# frozen_string_literal: true

class Service < ApplicationRecord
  has_one :monitoring_schema
  has_many :monitoring_shifts

  validates_presence_of :name
end
