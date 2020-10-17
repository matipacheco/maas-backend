class Service < ApplicationRecord
  has_one :contract

  validates_presence_of :name
end
