class AddAdditionalDetailToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :additional_detail, :text
  end
end
