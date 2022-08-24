class Api::V1::UsersController < ApiController
  before_action :set_user_friend, only: [:friends, :friend, :followers]
  def index
    @users = User.all
    render json: {
      users: @users.map do |user|
        { id: user.id,
          name: user.name }
      end
    }
  end

  def show
    @user = User.includes(:sleep_records).find_by!(id: params[:id])
    render json: {
      name: @user.name,
      sleep_records: @user.sleep_records.order_by_created_time_desc.map do |record|
        { start_sleep_at: record.created_at.strftime("%m/%d %H:%M %p"),
          sleep_time: record.sleep_time }
      end
    }
  end

  def friends
    set_user_friend
    render json: {
      name: @user.name,
      friends: @user.friends.map do |friend|
        { name: friend.name }
      end
    }
  end

  def friend
    set_user_friend
    @friend = @user.friends.find_by!(id: params[:friend_id])

    if @friend.present?
      render json: {
        name: @friend.name,
        sleep_records: @friend.sleep_records.order_by_sleep_time_desc.map do |record|
          start_time = record.created_at
          end_time = record.updated_at
          { date: start_time.strftime("%m/%d"),
            start_sleep_at: start_time.strftime("%H:%M %p"),
            wake_up_at: end_time.strftime("%H:%M %p"),
            sleep_time: record.convert_sleep_time }
        end
      }
    end
  end

  def followers
    set_user_friend
    render json: {
      name: @user.name,
      followers: @user.followers.map do |friend|
        { name: friend.name }
      end
    }
  end

  private

  def set_user_friend
    @user = User.includes(:friendships).find_by!(id: params[:id])
  end
end
