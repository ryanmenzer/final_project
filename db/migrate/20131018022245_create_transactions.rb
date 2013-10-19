class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :tenant_id
      t.integer :transaction_type_id, null: false
      t.integer :sponsorship_id,      null: false
      t.integer :payer_id,            null: false
      t.date    :date,                null: false
      t.float   :amount
      t.string  :status

      t.timestamps
    end
    add_index :transactions, :tenant_id
    add_index :transactions, :transaction_type_id
    add_index :transactions, :sponsorship_id
    add_index :transactions, :payer_id
    add_index :transactions, :date
    add_index :transactions, :amount
    add_index :transactions, :status
  end
end
