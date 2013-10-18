class CreateGroupsUsers < ActiveRecord::Migration
  def change
    create_table :groups_users, id: false do |t|
      t.integer :user_id
      t.integer :group_id, null: false

      t.timestamps
    end
    add_index :groups_users, :user_id
    add_index :groups_users, :group_id
  end
end
