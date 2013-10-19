class CreateMandrillSettings < ActiveRecord::Migration
  def change
    create_table :mandrill_settings do |t|
      t.integer :tenant_id
      t.string  :api_email
      t.string  :api_key

      t.timestamps
    end
    add_index :mandrill_settings, :tenant_id
  end
end
