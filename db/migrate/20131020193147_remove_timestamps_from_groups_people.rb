class RemoveTimestampsFromGroupsPeople < ActiveRecord::Migration
  def up
    remove_column :groups_people, :created_at
    remove_column :groups_people, :updated_at
  end

  def down
    add_column :groups_people, :updated_at, :string
    add_column :groups_people, :created_at, :string
  end
end
