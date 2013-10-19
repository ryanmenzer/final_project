class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.integer :tenant_id
      t.string  :display_name
      t.integer :logo_id
      t.string  :cat_1_name
      t.string  :cat_2_name
      t.string  :cat_3_name
      t.integer :paypal_setting_id
      t.integer :mandrill_setting_id
      t.integer :primary_contact_id

      t.timestamps
    end
    add_index :settings, :tenant_id
  end
end
