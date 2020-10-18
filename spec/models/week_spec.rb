# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Week, type: :model do
  it { should have_many(:availabilities) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:start_date) }
end
