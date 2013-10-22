class AddColumnToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :paypal_payment_id, :integer
  end
end
