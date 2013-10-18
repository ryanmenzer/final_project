class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :tenant_id,    null: false
      t.string  :title,        null: false
      t.string  :url,          null: false
      t.integer :imageable_id
      t.string  :imageable_type

      t.timestamps
    end
    add_index :images, :tenant_id
    add_index :images, :title
    add_index :images, :url
    add_index :images, :imageable_id
    add_index :images, :imageable_type
  end
end
