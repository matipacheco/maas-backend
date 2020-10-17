class Service < ApplicationRecord
  has_one :monitoring_schema

  validates_presence_of :name
end
