FactoryBot.define do
  factory :sleep_record do
    trait :with_user do
      user { create(:user) }
    end

    trait :with_sleep_time do
      updated_at { Time.now + 8.hours }
      sleep_time { 28800 }
    end
  end
end
