class Hour < ApplicationRecord
  validates_presence_of :hour
  has_many :employee_availabilities
end
