class AddSleepTimeToSleepRecords < ActiveRecord::Migration[6.1]
  def change
    add_column :sleep_records, :sleep_time, :integer, default: 0
  end
end
