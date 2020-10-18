class EmployeeAvailability < ApplicationRecord
  belongs_to :hour
  belongs_to :employee
end
