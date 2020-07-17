FactoryBot.define do
  factory :group do
    name { Faker::Book.genre }
  end
end
