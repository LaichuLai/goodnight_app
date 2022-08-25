FactoryBot.define do
  factory :sleep_record do
    trait :with_user do
      user { create(:user) }
    end
  end
end