FactoryGirl.define do

  factory :group do
    group_name  { Faker::Team.state }
    created_at  { Faker::Time.between(DateTime.yesterday - 1, DateTime.yesterday) }
    updated_at  { Faker::Time.between(DateTime.yesterday - 1, DateTime.yesterday) }

  end
end
