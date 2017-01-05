FactoryGirl.define do

  factory :message do
    body                  { Faker::Lorem.sentence }
    image                 { Faker::Avatar.image }
    created_at            { Faker::Time.between(DateTime.yesterday - 1, DateTime.yesterday) }
    updated_at            { Faker::Time.between(DateTime.yesterday - 1, DateTime.yesterday) }
  end

  factory :params_invalid, class: Message do
    body nil
  end
end
