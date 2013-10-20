class RemoveTimestampsFromPeopleSponsorships < ActiveRecord::Migration
  def up
    remove_column :people_sponsorships, :created_at
    remove_column :people_sponsorships, :updated_at
  end

  def down
    add_column :people_sponsorships, :updated_at, :string
    add_column :people_sponsorships, :created_at, :string
  end
end
