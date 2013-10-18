class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :tenant_id
      t.string :name,       null: false

      t.timestamps
    end

    add_index :roles, :tenant_id
  end
end
