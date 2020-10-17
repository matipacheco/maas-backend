# frozen_string_literal: true

class MonitoringShift < ApplicationRecord
  belongs_to :week
  belongs_to :service

  serialize :structure
end
