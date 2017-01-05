FactoryGirl.define do

  factory :user do
    name    { Faker::Name.name }
    email   { Faker::Internet.email }
    password              "password"
    password_confirmation  "password"
    created_at            { Faker::Time.between(DateTime.now - 1, DateTime.now) }
    updated_at            { Faker::Time.between(DateTime.now - 1, DateTime.now) }
  end
end
