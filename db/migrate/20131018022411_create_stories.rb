class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.integer :tenant_id
      t.integer :author_id, null: false
      t.string  :title,     null: false
      t.text    :content
      t.integer :storyable_id
      t.string  :storyable_type

      t.timestamps
    end
    add_index :stories, :tenant_id
    add_index :stories, :title
    add_index :stories, :storyable_id
    add_index :stories, :storyable_type
  end
end
