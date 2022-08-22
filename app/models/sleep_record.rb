class SleepRecord < ApplicationRecord
  belongs_to :user

  scope :order_by_created_time_desc, -> { order(created_at: :desc) }
end
