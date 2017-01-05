FactoryGirl.define do

  factory :user do
    name {Faker::Name.name}
    email { Faker::Internet.email}
    password              "password"
    password_confirmation  "password"
    created_at            "2016-12-24 11:11:11"
    updated_at            "2016-12-24 11:11:11"
  end
end
