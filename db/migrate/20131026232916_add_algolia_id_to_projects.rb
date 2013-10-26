class AddAlgoliaIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :algolia_id, :integer
  end
end
