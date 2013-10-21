class AddColumnTenantSettings < ActiveRecord::Migration
  def up
    add_column :settings, :default_email, :string
  end

  def down
    remove_column :settings, :default_email
  end
end
