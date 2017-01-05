FactoryGirl.define do

  factory :user do
    name    { Faker::Name.name }
    email   { Faker::Internet.email }
    password              "password"
    password_confirmation  "password"
    created_at            { Faker::Time.between(DateTime.yesterday - 1, DateTime.yesterday) }
    updated_at            { Faker::Time.between(DateTime.yesterday - 1, DateTime.yesterday) }
  end
end
