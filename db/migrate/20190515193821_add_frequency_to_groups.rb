class AddFrequencyToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :frequency, :string
  end
end
