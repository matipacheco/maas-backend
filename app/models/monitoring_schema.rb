# frozen_string_literal: true

class MonitoringSchema < ApplicationRecord
  belongs_to :service

  serialize :structure
end
