require 'rails_helper'

RSpec.describe Availability, type: :model do
  it { should belong_to(:week) }
  it { should belong_to(:hour) }
  it { should belong_to(:employee) }
end
