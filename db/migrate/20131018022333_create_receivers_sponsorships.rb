class CreateReceiversSponsorships < ActiveRecord::Migration
  def change
    create_table :receivers_sponsorships, id: false do |t|
      t.integer :receiver_id,    null: false
      t.integer :sponsorship_id, null: false

      t.timestamps
    end
  end
end
