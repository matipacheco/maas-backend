require 'rails_helper'

RSpec.describe Service, type: :model do
  it { should have_one(:contract) }
  it { should validate_presence_of(:name) }
end
