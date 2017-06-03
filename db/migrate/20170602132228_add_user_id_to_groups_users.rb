class AddUserIdToGroupsUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :groups_users, :user_id, :integer
  end
end
