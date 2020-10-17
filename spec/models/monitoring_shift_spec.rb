# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MonitoringShift, type: :model do
  it { should belong_to(:week) }
  it { should belong_to(:service) }

  it { should validate_presence_of(:week) }
  it { should validate_presence_of(:service) }
end
