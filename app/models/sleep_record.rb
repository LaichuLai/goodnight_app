class SleepRecord < ApplicationRecord
  belongs_to :user

  scope :order_by_created_time_desc, -> { order(created_at: :desc) }
  scope :order_by_sleep_time_desc, -> { where(created_at: (1.weeks.ago)..(DateTime.now)).
                                        where.not(sleep_time: nil).
                                        order(sleep_time: :desc) }

  def count_sleep_time
    sleep_sec = Time.now - self.created_at
  end

  def convert_sleep_time
    sec = self.sleep_time
    [sec / 3600, sec / 60 % 60, sec % 60].map{|t| t.to_s.rjust(2,'0')}.join(':')
  end
end
