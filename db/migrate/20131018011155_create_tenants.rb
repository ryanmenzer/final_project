class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.integer :tenant_id
      t.string  :org_name, null: false

      t.timestamps
    end

    add_index :tenants, :org_name

  end
end
