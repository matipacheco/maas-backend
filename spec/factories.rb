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
  end

  factory :week do
    name { 'Test Week' }
    start_date { Date.today.beginning_of_week }
    end_date { Date.today.end_of_week }
  end

  factory :availability do
    employee
    monitoring_shift
    day { rand(0...7) }
    hour { rand(0...24) }
  end

  factory :monitoring_shift do
    week
    service
    structure do
      {
        0 => {
          19 => 1,
          20 => 1,
          21 => 1,
          22 => 2,
          23 => 2
        }
      }
    end
  end
end
