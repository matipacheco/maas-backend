require 'rails_helper'

RSpec.describe MonitoringShift, type: :model do
  it { should belong_to(:week) }
  it { should belong_to(:service) }
end
