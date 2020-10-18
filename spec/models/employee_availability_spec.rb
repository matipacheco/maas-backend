require 'rails_helper'

RSpec.describe EmployeeAvailability, type: :model do
  it { should belong_to(:hour) }
  it { should belong_to(:employee) }
end
