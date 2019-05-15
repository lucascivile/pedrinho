class RemoveMemberFromGroups < ActiveRecord::Migration[5.2]
  def change
    remove_column :groups, :member, :string
  end
end
