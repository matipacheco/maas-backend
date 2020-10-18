require 'rails_helper'

RSpec.describe Hour, type: :model do
  it { should validate_presence_of(:hour) }
  it { should have_many(:employee_availabilities) }
end
