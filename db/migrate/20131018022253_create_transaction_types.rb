class CreateTransactionTypes < ActiveRecord::Migration
  def change
    create_table :transaction_types do |t|
      t.integer :tenant_id
      t.string  :name, null: false

      t.timestamps
    end
    add_index :transaction_types, :tenant_id
  end
end
