class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :tenant_id, null: false
      t.string :name,       null: false

      t.timestamps
    end

    add_index :categories, :tenant_id

  end
end
