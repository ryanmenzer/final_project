class AddTenantIdToPaypal < ActiveRecord::Migration
  def change
    add_column :paypal_payments, :tenant_id, :integer
    add_index :paypal_payments, :tenant_id
  end
end
