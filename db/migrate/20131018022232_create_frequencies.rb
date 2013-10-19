class CreateFrequencies < ActiveRecord::Migration
  def change
    create_table :frequencies do |t|
      t.integer :tenant_id
      t.string  :name

      t.timestamps
    end
    add_index :frequencies, :tenant_id
    add_index :frequencies, :name
  end
end
