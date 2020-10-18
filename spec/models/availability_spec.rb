require 'rails_helper'

RSpec.describe Availability, type: :model do
  it { should belong_to(:week) }
  it { should belong_to(:employee) }

  it { should validate_presence_of(:week) }
  it { should validate_presence_of(:employee) }

  it { should validate_presence_of(:day) }
  it { should validate_presence_of(:hour) }
end
