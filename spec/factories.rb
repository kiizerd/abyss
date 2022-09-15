FactoryBot.define do
  factory :project do
    name { "Factory-made Project" }
    description { "A testing object made with FactoryBot." }

    trait :invalid do
      description { nil }
    end
  end
end