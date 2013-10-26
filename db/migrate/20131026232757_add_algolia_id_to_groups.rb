class AddAlgoliaIdToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :algolia_id, :integer
  end
end
