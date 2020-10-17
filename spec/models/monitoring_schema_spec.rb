require 'rails_helper'

RSpec.describe MonitoringSchema, type: :model do
  it { should belong_to(:service) }
end
