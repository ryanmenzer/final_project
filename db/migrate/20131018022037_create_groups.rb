class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :tenant_id
      t.integer :manager_id, null: false
      t.string  :name

      t.timestamps
    end
    add_index :groups, :tenant_id
    add_index :groups, :manager_id
  end
end
