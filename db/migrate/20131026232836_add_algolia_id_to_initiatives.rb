class AddAlgoliaIdToInitiatives < ActiveRecord::Migration
  def change
    add_column :initiatives, :algolia_id, :integer
  end
end
