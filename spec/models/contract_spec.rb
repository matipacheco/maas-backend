require 'rails_helper'

RSpec.describe Contract, type: :model do
  it { should belong_to(:service) }
end
