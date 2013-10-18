class CreateFrequencies < ActiveRecord::Migration
  def change
    create_table :frequencies do |t|
      t.integer :tenant_id
      t.string  :title

      t.timestamps
    end
    add_index :frequencies, :tenant_id
    add_index :frequencies, :title
  end
end
