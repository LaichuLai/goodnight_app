class AddSleepTimeToSleepRecords < ActiveRecord::Migration[6.1]
  def change
    add_column :sleep_records, :sleep_time, :decimal, precision: 4, scale: 2, default: 0
  end
end
