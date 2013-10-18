class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :tenant_id
      t.integer :transaction_type_id, null: false
      t.integer :sponsorship_id,      null: false
      t.date    :date,                null: false
      t.string  :paypal_status

      t.timestamps
    end
    add_index :transactions, :tenant_id
    add_index :transactions, :transaction_type_id
    add_index :transactions, :sponsorship_id
    add_index :transactions, :date
    add_index :transactions, :paypal_status
  end
end
