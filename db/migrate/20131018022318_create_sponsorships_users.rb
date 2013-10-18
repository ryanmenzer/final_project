class CreateSponsorshipsUsers < ActiveRecord::Migration
  def change
    create_table :sponsorships_users, id: false do |t|
      t.integer :sponsorship_id, null: false
      t.integer :sponsor_id,     null: false
      
      t.timestamps
    end
      add_index :sponsorships_users, :sponsorship_id
      add_index :sponsorships_users, :sponsor_id
  end
end
