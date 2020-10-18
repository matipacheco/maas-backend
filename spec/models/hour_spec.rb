require 'rails_helper'

RSpec.describe Hour, type: :model do
  it { should validate_presence_of(:hour) }
end
