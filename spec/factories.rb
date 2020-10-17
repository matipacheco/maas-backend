# frozen_string_literal: true

FactoryBot.define do
  factory :service do
    name { 'Test Service' }
  end

  factory :monitoring_schema do
    structure { { 0 => (0...24).to_a } }
    service
  end

  factory :employee do
    name { 'Test Employee' }
    availability { rand(1...20) }
  end

  factory :week do
    name { 'Test Week' }
    start_date { Date.today.beginning_of_week }
    end_date { Date.today.end_of_week }
  end

  factory :monitoring_shift do
    service
    week
  end
end
