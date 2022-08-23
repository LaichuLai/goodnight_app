class Api::V1::SleepRecordsController < ApiController
  def create
    if check_latest_record.nil? || check_latest_record&.sleep_time.present?
      sleep_record = SleepRecord.new(user_id: @user.id)
      if sleep_record.save
        render json: { message: "Good Night #{@user.name}" }
      else
        render json:  { message: "Failed to start sleeping cycle" }
      end
    else
      render json:  { message: "Currently timing" }
    end
  end

  def update
    if check_latest_record.present? && check_latest_record&.sleep_time.nil?
      @latest_record.update(sleep_time: @latest_record.count_sleep_time)
      render json: { message: "Good Day #{@user.name}" }
    else
      render json: { message: "You should press \'Start Sleeping\' first" }
    end
  end

  private

  def check_latest_record
    @user = User.includes(:sleep_records).find_by!(name: params[:name])
    @latest_record = @user.sleep_records.last
  end
end
