FactoryGirl.define do

  factory :group do
    group_name  { Faker::Team.state }
    created_at  { Faker::Time.between(DateTime.now - 1, DateTime.now) }
    updated_at  { Faker::Time.between(DateTime.now - 1, DateTime.now) }
  end
end
