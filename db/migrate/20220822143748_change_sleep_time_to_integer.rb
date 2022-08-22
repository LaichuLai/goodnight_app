class ChangeSleepTimeToInteger < ActiveRecord::Migration[6.1]
  def change
    change_column :sleep_records, :sleep_time, :integer, default: nil
  end
end
