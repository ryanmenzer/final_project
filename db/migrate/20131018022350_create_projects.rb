class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :tenant_id,  null: false
      t.integer :manager_id, null: false
      t.string  :name,       null: false

      t.timestamps
    end
    add_index :projects, :tenant_id
    add_index :projects, :manager_id
    add_index :projects, :name
  end
end
