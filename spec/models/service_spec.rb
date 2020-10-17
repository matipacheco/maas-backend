require 'rails_helper'

RSpec.describe Service, type: :model do
  it { should have_one(:monitoring_schema) }
  it { should validate_presence_of(:name) }
end
