# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Availability, type: :model do
  it { should belong_to(:employee) }
  it { should belong_to(:monitoring_shift) }

  it { should validate_presence_of(:employee) }
  it { should validate_presence_of(:monitoring_shift) }

  it { should validate_presence_of(:day) }
  it { should validate_presence_of(:hour) }
end
