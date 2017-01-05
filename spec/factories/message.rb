FactoryGirl.define do

  factory :message do
<<<<<<< HEAD
    body                  { Faker::Lorem.sentence }
    image                 { Faker::Avatar.image }
    created_at            { Faker::Time.between(DateTime.yesterday - 1, DateTime.yesterday) }
    updated_at            { Faker::Time.between(DateTime.yesterday - 1, DateTime.yesterday) }
  end

  factory :params_invalid, class: Message do
    body nil
=======
    body                  "Hello World"
    image                 "image.pnp"
    user_id               "1"
    group_id              "1"
    created_at            "2016-12-24 11:11:11"
    updated_at            "2016-12-24 11:11:11"
>>>>>>> master
  end
end
