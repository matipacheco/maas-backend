class Week < ApplicationRecord
  validates_presence_of :name, :start_date
end
