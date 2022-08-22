class Api::V1::UsersController < ApiController
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
    @user = User.find_by(name: params[:user_name])
    render json: {
      name: @user.name,
      sleep_records: @user.sleep_records.order_by_created_time_desc.map do |record|
        { start_sleep_at:record.created_at.strftime("%m/%d %H:%M %p"),
          sleep_time: record.sleep_time }
      end
    }
  end
end
