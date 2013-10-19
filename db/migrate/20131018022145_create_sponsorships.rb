class CreateSponsorships < ActiveRecord::Migration
  def change
    create_table :sponsorships do |t|
      t.integer :tenant_id
      t.integer :initiative_id,   null: false
      t.integer :frequency_id
      t.boolean :recurring_payment
      t.float   :amount
      t.boolean :active
      t.date    :start_date
      t.date    :end_date

      t.timestamps
    end
    add_index :sponsorships, :tenant_id
    add_index :sponsorships, :initiative_id
    add_index :sponsorships, :start_date
    add_index :sponsorships, :end_date
  end
end
