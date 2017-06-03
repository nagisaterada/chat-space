class AddGroupIdToGroupsUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :groups_users, :group_id, :integer
  end
end
