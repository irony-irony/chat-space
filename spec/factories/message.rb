FactoryGirl.define do

  factory :message do
    body                  { Faker::Lorem.sentence }
    image                 { Faker::Avatar.image }
    created_at            { Faker::Time.between(DateTime.now - 1, DateTime.now) }
    updated_at            { Faker::Time.between(DateTime.now - 1, DateTime.now) }
  end

  factory :params_invalid, class: Message do
    body nil
  end
end
