class Availability < ApplicationRecord
  belongs_to :week
  belongs_to :hour
  belongs_to :employee
end
