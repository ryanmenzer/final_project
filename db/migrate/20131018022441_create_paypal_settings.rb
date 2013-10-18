class CreatePaypalSettings < ActiveRecord::Migration
  def change
    create_table :paypal_settings do |t|
      t.integer :tenant_id
      t.string  :api_username
      t.string  :api_password
      t.string  :api_signature

      t.timestamps
    end
    add_index :paypal_settings, :tenant_id
  end
end
