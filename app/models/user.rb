class User < ApplicationRecord
  has_many :sleep_records
  has_many :friendships, foreign_key: "follower_id", dependent: :destroy
  has_many :friends, through: :friendships, source: :friend
  has_many :follower_friendships, class_name: "Friendship", foreign_key: "friend_id", dependent: :destroy
  has_many :followers, through: :follower_friendships, source: :follower

  validates :name, presence: true

  def make_friend(friend)
    friendships.create(friend_id: friend.id)
  end

  def unfriend(friend)
    friendships.find_by!(friend_id: friend.id).destroy
  end

end
