FactoryGirl.define do

  factory :message do
    body                  {Faker::Lorem.sentence}
    image                 "image.pnp"
    created_at            "2016-12-24 11:11:11"
    updated_at            "2016-12-24 11:11:11"
  end

  factory :params_invalid, class: Message do
    body nil
  end
end
