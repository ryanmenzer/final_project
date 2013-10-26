class AddAlgoliaIdToPeople < ActiveRecord::Migration
  def change
    add_column :people, :algolia_id, :integer
  end
end
