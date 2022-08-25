class Api::V1::FriendshipsController < ApiController
  def create
    user = User.find(params[:user_id])
    friend = User.find(params[:friend_id])
    if user.make_friend(friend)
      render json: { message: "Your just followed a friend!" }
    else
      render json: { message: "Failed to follow this friend" }
    end
  end

  def destroy
    user = User.includes(:friendships).find(params[:user_id])
    friend = user.friends.find(params[:friend_id])
    if user.unfriend(friend)
      render json: { message: "Your just unfollowed a friend!" }
    else
      render json: { message: "Failed to unfollow this friend" }
    end
  end
end
