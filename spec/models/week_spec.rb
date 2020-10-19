# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Week, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:end_date) }
end
