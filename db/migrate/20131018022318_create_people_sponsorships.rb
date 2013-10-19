class CreatePeopleSponsorships < ActiveRecord::Migration
  def change
    create_table :people_sponsorships, id: false do |t|
      t.integer :sponsorship_id, null: false
      t.integer :sponsor_id,     null: false

      t.timestamps
    end
      add_index :people_sponsorships, :sponsorship_id
      add_index :people_sponsorships, :sponsor_id
  end
end
