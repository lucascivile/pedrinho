class ChangeGroupFrequencyName < ActiveRecord::Migration[5.2]
  def change
    rename_column :groups, :frequency, :date_time
  end
end
