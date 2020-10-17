FactoryBot.define do
  factory :service do
    name { "Test Service" }
  end

  factory :employee do
    name { "Test Employee" }
    availability { rand(1...20) }
  end

end
