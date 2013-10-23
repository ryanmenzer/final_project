class AddAmountToPaypalPayment < ActiveRecord::Migration
  def change
    add_column :paypal_payments, :amount, :string
  end
end
