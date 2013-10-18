class CreateReceivers < ActiveRecord::Migration
  def change
    create_table :receivers do |t|
      t.integer :tenant_id
      t.integer :initiative_id,     null: false
      t.integer :receiverable_id,   null: false
      t.string  :receiverable_type, null: false

      t.timestamps
    end
    add_index :receivers, :tenant_id
    add_index :receivers, :initiative_id
  end
end
