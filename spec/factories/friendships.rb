FactoryBot.define do
  factory :friendship do
    association :follower, factory: :user
    association :friend, factory: :user
  end
end
