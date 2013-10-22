class CreatePaypalPayments < ActiveRecord::Migration
  def change
    create_table :paypal_payments do |t|
      t.integer :payer_id
      t.integer :sponsorship_id
      t.string  :paypal_payer_id
      t.string  :paypal_token
      t.string  :paypal_recurring_token
      t.boolean :active

      t.timestamps
    end
  end
end
