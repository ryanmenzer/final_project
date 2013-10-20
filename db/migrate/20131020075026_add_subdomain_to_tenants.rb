class AddSubdomainToTenants < ActiveRecord::Migration
  def change
    add_column :tenants, :subdomain, :string
  end
end
