class AddPlaceToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :place, :string
  end
end
