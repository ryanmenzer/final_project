class RemoveTimestampsFromReceiversSponsorships < ActiveRecord::Migration
  def up
    remove_column :receivers_sponsorships, :created_at
    remove_column :receivers_sponsorships, :updated_at
  end

  def down
    add_column :receivers_sponsorships, :updated_at, :string
    add_column :receivers_sponsorships, :created_at, :string
  end
end
