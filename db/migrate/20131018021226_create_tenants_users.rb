class CreateTenantsUsers < ActiveRecord::Migration
  def change
    create_table :tenants_users, id: false do |t|
      t.integer :user_id
      t.integer :tenant_id
    end

    add_index :tenants_users, :tenant_id
    add_index :tenants_users, :user_id
  end
end
