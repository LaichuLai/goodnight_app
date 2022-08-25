class Friendship < ApplicationRecord
  acts_as_paranoid

  belongs_to :follower, class_name: "User"
  belongs_to :friend, class_name: "User"

  validates :follower_id, presence: true
  validates :friend_id, presence: true
end
