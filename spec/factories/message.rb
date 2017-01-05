FactoryGirl.define do

  factory :message do
    body                  "Hello World"
    image                 "image.pnp"
    user_id               "1"
    group_id              "1"
    created_at            "2016-12-24 11:11:11"
    updated_at            "2016-12-24 11:11:11"
  end
end
