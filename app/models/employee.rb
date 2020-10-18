# frozen_string_literal: true

class Employee < ApplicationRecord
  validates_presence_of :name
end
