class AddCostToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :cost, :float
  end
end
