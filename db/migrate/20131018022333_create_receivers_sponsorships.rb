class CreateReceiversSponsorships < ActiveRecord::Migration
  def change
    create_table :receivers_sponsorships, id: false do |t|
      t.integer :receiver_id,    null: false
      t.integer :sponsorship_id, null: false

      t.timestamps
    end
    add_index :receivers_sponsorships, :receiver_id
    add_index :receivers_sponsorships, :sponsorship_id
  end
end
